#ifndef __fdb_hh
#define __fdb_hh

#include <memory>
#include <cstdint>


namespace FDB
{

    constexpr int bytes2words(int x) {
        int v = x>>2;
        v += (x & 3) ? 1 : 0;
        return v;
    }

    const uint32_t NOT_FOUND = -1;
    const uint32_t LAST_VALID_ID = -2;

    class Storage
    {
    public:
        Storage();
        ~Storage();
        // Return page size in 32bit words
        int PageSize();
        // Return pointer for the first page
        const uint32_t *Data();
        // Write data to the backing store
        int Write(const uint32_t *src, int len, uint32_t offset, uint8_t page);
        void ErasePage(int pageno);

    protected:
        uint32_t *_baseptr;
    };

    struct __attribute__((packed)) DataItem // 
    {
        uint32_t ID;
        uint16_t adler16; // Computed over length, record, 4*(length+1) bytes
        uint8_t length; // Length-1 in 32-bit words. 0 means 256
        uint8_t record_type; // Type of data in this block. Used for creating indices

        void InitAdler16(uint8_t *data, int len);
        void UpdateAdler16(uint8_t *data, int len);
        uint16_t GetAdler16() const;
        bool CheckAdler16() const;
    };

    struct Record{
        uint32_t ID;
        const DataItem *item;
        uint32_t page;
    };

    
    class Layout{
    public:
        struct Status{
            uint32_t first_free_offset;
            uint32_t last_used_ID;
            uint32_t active_page;
            void print() const;
        };
        Layout(Storage& storage);
        Record FindByID(uint32_t ID);
        Record FindFirst(uint8_t type);
        Record FindNextAfter(Record rec);
        void Delete(Record);
        const uint32_t *GetData(Record rec);
        uint32_t GetDataLength(Record rec);
        Record Insert(uint32_t *data, int length, uint8_t type, uint32_t *sec_data=nullptr, int sec_len = 0);
        void Compact();
        uint32_t GetFreeSpace();
        uint32_t GetLastUsedID();
        const struct Status& GetStatus(){return status;}

    private:
        Storage& storage;
        struct Status status;
    };

 
    template <typename T, int N, uint8_t dtype>
    class Index{
    public:
        static_assert((sizeof(T) & 3) == 0, "Indexed type must be 4-byte padded");

        struct Result{
            uint32_t index;
            T value;
        };
        struct ResultEx{
            uint32_t index;
            T value;
            void *data;
            uint32_t datalen;
        };

        Index(Layout &layout) : layout(layout), num_records(0){
            // Initialize with empty records
            for (int n=0; n < N; n++){
                records[n]={.ID=NOT_FOUND};
            }
            // Find the ones that may exist already
            Record rec = layout.FindFirst(dtype);
            complete = true;
            while (rec.item && num_records < N){
                records[num_records++]=rec;
                rec = layout.FindNextAfter(rec);
            }
            if (num_records == N && rec.item) complete = false;
        }

        Result GetEntry(int n){
            Result r;
            const void *src = layout.GetData(records[n]);
            if (src == nullptr){
                r.index = NOT_FOUND;
                return r;
            }
            int len = sizeof(T);
            void *dest = &r.value;
            memcpy(dest,src,len);
            r.index = n;
            return r;
        }

        uint32_t GetEntryID(int n){
            return records[n].ID;
        }

        template <class Func>
        Result GetEntryMatching(Func func, int start=0){
            Result rv;
            for (int n=start; n < num_records; n++){
                rv = this->GetEntry(n);
                if (rv.index != NOT_FOUND && func(rv.value)){
                    return rv;
                }
            }
            
            rv.index=NOT_FOUND;
            return rv;
        }

        Result GetEntryWithID(uint32_t id){
            for (int n=0; n < num_records; n++){
                if (records[n].ID==id) return GetEntry(n);
            }
            return {.index = NOT_FOUND};
        }

        int GetExtendedSize(Result r){
            return layout.GetDataLength(records[r.index])-sizeof(T)/sizeof(uint32_t);
        }

        int GetExtendedData(Result r, void *buffer, int buflen){
            int l = this->GetExtendedSize(r);
            l = (l*sizeof(uint32_t) < buflen) ? l*sizeof(uint32_t) : buflen;
            const uint32_t *p = layout.GetData(records[r.index]);
            if (!p) return 0;
            const uint8_t *src = (const uint8_t *)p;
            src += sizeof(T);
            memcpy(buffer,src,l);
            return l;
        }
        
        int Size(){
            return num_records;
        }

        void DeleteIndex(unsigned index){
            if (index < num_records) layout.Delete(records[index]);
            num_records -= 1;
            while (index < num_records){
                records[index] = records[index+1];
                index ++;
            }
            records[index].ID=NOT_FOUND;
            records[index].item=nullptr;
        }

        void Delete(Result r){
            if (r.index != FDB::NOT_FOUND)
                DeleteIndex(r.index);
        }

        uint32_t Append(T value){
            // Can't insert if the index is full
            if (num_records == N){
                return NOT_FOUND;
            }
            Record &r = records[num_records] = layout.Insert((uint32_t *)&value,sizeof(T)/sizeof(uint32_t),dtype);
            if (r.ID == NOT_FOUND) return NOT_FOUND;
            return num_records++;
        }

        uint32_t Append(T value, uint32_t *buffer, int buflen){
            if (num_records == N){
                return NOT_FOUND;
            }
            // Layout value and data 32-bit aligned
            Record &r = records[num_records] = layout.Insert(&value,sizeof(T)/sizeof(uint32_t),dtype,buffer,buflen);
            if (r.ID == NOT_FOUND) return NOT_FOUND;
            return num_records++;
        }

        bool IsComplete(){
            return complete;
        }

    private:
        Record records[N];
        Layout& layout;
        int num_records;
        bool complete;
    };

} // namespace FDB
#endif
