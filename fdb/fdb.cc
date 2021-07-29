#include "fdb.hh"
#include <cstdint>
#include "bfs_alloca.h"
#include <assert.h>
#include <cstring>
#include <cstdio>

namespace FDB
{
    //// Dataitem
    uint16_t StepAdler16(uint16_t init_cnt, const uint8_t *dptr, int len){
        unsigned cnt1 = init_cnt & 0xff;
        unsigned cnt2 = init_cnt >> 8;
        for (int i=0; i < len; i++){
            cnt1 += *dptr ++;
            if (cnt1 >= 251) cnt1 -= 251;
            if (cnt1 >= 251) cnt1 -= 251;
            cnt2 += cnt1;
            if (cnt2 > 251) cnt2 -= 251;
        }
        return static_cast<uint16_t>(cnt2 << 8 | cnt1);        
    }

    uint16_t DataItem::GetAdler16() const{
        const uint8_t *dptr = reinterpret_cast<const uint8_t*>(this);
        dptr += 6; // Compute over length
        int len =this->length;
        if (len ==0) len = 256;
        len <<= 2;
        uint16_t adler =  StepAdler16(0x0001,dptr,len+2);
        return adler;        
    }
    
    void DataItem::InitAdler16(uint8_t *data, int len){
        this->adler16 = StepAdler16(1,data,len);
    }

    void DataItem::UpdateAdler16(uint8_t *data, int len)
    {
        this->adler16 = StepAdler16(this->adler16,data,len);
    }

    bool DataItem::CheckAdler16() const{
        return this->adler16 == this->GetAdler16();
    }

    //// Layout
    Layout::Layout(Storage& storage) : storage(storage){
        const uint32_t *baseptr = storage.Data();
        // This layout only works with two pages
        uint32_t p0idx = *baseptr;
        uint32_t p1idx = *(baseptr + storage.PageSize());
        if (p0idx == NOT_FOUND){
            if (p1idx == NOT_FOUND){
                // Both pages are cleared, we are in factory reset. Activate the first page
                p0idx = 0;
                storage.Write(&p0idx,1,0,0);  
                status.active_page = 0;
            }else{
                status.active_page = 1; 
            }
        }else{
            // Check that we weren't in the middle of a page update that failed
            if (p1idx == NOT_FOUND){
                status.active_page = 0;
            }else{
                if (p1idx > p0idx){
                    status.active_page = 1;
                }else if (p1idx < p0idx){
                    status.active_page = 0;
                }else{
                  // Something went terribly wrong - we need to start from scratch
                  storage.ErasePage(0);
                  storage.ErasePage(1);
                  p0idx = p1idx = NOT_FOUND;
                }
            }
        }
        // Check integrity of the active page
        const uint32_t *dptr = storage.Data()+(1 & status.active_page)*storage.PageSize();
        // Skip page index
        uint32_t first_free = 1;
        dptr += 1;
        const DataItem *item = reinterpret_cast<const DataItem *>(dptr);
        bool records_broken = false;
        status.last_used_ID = 0;
        while (item->ID != NOT_FOUND){
            if (!item->CheckAdler16()){
                // Delete this broken record - trust that length is right, otherwise remaining records will 
                // break anyway.
                p0idx = 0;
                storage.Write(&p0idx,1,first_free,1 & status.active_page);
                records_broken = true;
            };
            if (item->ID != 0) status.last_used_ID = item->ID;
            int offs = sizeof(DataItem)/sizeof(uint32_t)+item->length;
            first_free += offs;
            dptr += offs;
            item = reinterpret_cast<const DataItem *>(dptr);
        }
        // Check that the rest of the page is clear - otherwise compact the database to purge records that are broken
        const uint32_t *end = storage.Data()+((1&status.active_page)+1)*storage.PageSize();
        while (dptr < end){
            if (*dptr != NOT_FOUND) break;
            dptr ++;
        }
        if (dptr < end || records_broken){
            // There was cruft in the page - clean it up
            this->Compact();
        }else{
            status.first_free_offset=first_free;
        }
    }

    Record Layout::FindByID(uint32_t ID){
        const uint32_t *dptr = storage.Data()+(1&status.active_page)*storage.PageSize()+1;
        const DataItem *item = reinterpret_cast<const DataItem *>(dptr);
        const uint32_t *end = storage.Data()+((1&status.active_page)+1)*storage.PageSize();
        if (ID != NOT_FOUND){
            while (dptr < end && item->ID != NOT_FOUND && item->ID != ID){
                dptr += sizeof(DataItem)/sizeof(uint32_t)+item->length;
                item = reinterpret_cast<const DataItem *>(dptr);
            }
        }
        Record rec;
        if (ID == NOT_FOUND || dptr == end || item->ID == NOT_FOUND){
            rec = {
                .ID = NOT_FOUND,
                .item = nullptr,
                .page = status.active_page
            };
        }else{
            rec = {
                .ID = item->ID,
                .item = item,
                .page = status.active_page
            };
        }
        return rec;
    }

    Record Layout::FindFirst(uint8_t type){
        const uint32_t *dptr = storage.Data()+(1&status.active_page)*storage.PageSize()+1;
        const DataItem *item = reinterpret_cast<const DataItem *>(dptr);
        const uint32_t *end = storage.Data()+((1&status.active_page)+1)*storage.PageSize();
        while (dptr < end && item->ID != NOT_FOUND && item->record_type != type){
            dptr += sizeof(DataItem)/sizeof(uint32_t)+item->length;
            item = reinterpret_cast<const DataItem *>(dptr);
        }
        Record rec;
        if (dptr == end || item->ID == NOT_FOUND){
            rec = {
                .ID = NOT_FOUND,
                .item = nullptr,
                .page = status.active_page
            };
        }else{
            rec = {
                .ID = item->ID,
                .item = item,
                .page = status.active_page
            };
        }
        return rec;
    }

    Record Layout::FindNextAfter(Record rec){
        if (rec.page != status.active_page){
            rec = this->FindByID(rec.ID);
        }
        const uint32_t *dptr = reinterpret_cast<const uint32_t *>(rec.item);
        const DataItem *item = reinterpret_cast<const DataItem *>(dptr);
        const uint32_t *end = storage.Data()+((1&status.active_page)+1)*storage.PageSize();
        if (rec.item){
            do{
                dptr += sizeof(DataItem)/sizeof(uint32_t)+item->length;
                item = reinterpret_cast<const DataItem *>(dptr);
            }while (dptr < end && item->ID != NOT_FOUND && item->record_type != rec.item->record_type);
        }
        Record rrec;
        if (!rec.item || dptr < end || item->ID == NOT_FOUND){
            rrec = {
                .ID = NOT_FOUND,
                .item = nullptr,
                .page = status.active_page
            };
        }else{ 
            rrec = {
                .ID = item->ID,
                .item = item,
                .page = status.active_page
            };
        }
        return rrec;   
    }

    void Layout::Delete(Record rec){
        if (!rec.item) return;
        if (rec.page != status.active_page) rec =this->FindByID(rec.ID);
        const uint32_t *dptr = storage.Data()+(1&status.active_page)*storage.PageSize();
        size_t offs = reinterpret_cast<const uint32_t *>(rec.item)-dptr;
        uint32_t zero = 0;
        storage.Write(&zero,1,(uint32_t)offs,(1&status.active_page));
    }

    const uint32_t *Layout::GetData(Record rec){
        if (!rec.item) return nullptr;
        if (rec.page != status.active_page)
            rec = this->FindByID(rec.ID);
        if (!rec.item)
            return nullptr;
        if (!rec.item->CheckAdler16()){
            return nullptr;
        }
        const uint32_t *p = (const uint32_t *)rec.item;
        p+=sizeof(DataItem)/sizeof(uint32_t);
        return p;
    }

    uint32_t Layout::GetDataLength(Record rec){
        if (!rec.item) return NOT_FOUND;
        if (rec.page != status.active_page) rec = this->FindByID(rec.ID);
        return rec.item->length;
    }
    
    Record Layout::Insert(uint32_t *data, int length, uint8_t type, uint32_t *sec_data, int sec_len){
        assert(length+sec_len <= 256);
        unsigned wordlength = length + sizeof(DataItem)/sizeof(uint32_t);
        DataItem item;
        // Copy data to the buffer
        // Set up the data item to write to the storage
        item.length = length;
        item.record_type = type;
        item.ID = status.last_used_ID+1;
        if (sec_data){
            item.length += sec_len;
            wordlength += sec_len;
        }
        item.length &= 0xff;
        // Database is full - try to remedy
        if (status.first_free_offset+wordlength > storage.PageSize()){
            if (item.ID < NOT_FOUND){
                this->Compact();
            }
        }
        Record rec;
        // Check if the database has used all write slots - this is fatal
        if (status.first_free_offset+wordlength > storage.PageSize() || item.ID == NOT_FOUND){
            rec = {
                .ID=NOT_FOUND,
                .item = nullptr,
                .page = status.active_page
            };
        }else{
            // Make sure that sec_len i zero if sec_data is not available
            assert(sec_data != NULL || (sec_data == NULL && sec_len == 0));
            unsigned words_to_write = sizeof(DataItem)/sizeof(uint32_t);
            unsigned dsz = words_to_write;
            words_to_write += length;
            words_to_write += sec_len;
            
            // Allocate buffer on stack and prepare write
            uint32_t wordbuf[words_to_write];
            uint8_t *pwords = (uint8_t *)&item;
            
            memcpy(wordbuf+dsz, data, 4*length);
            if (sec_data) memcpy(wordbuf+dsz+length,sec_data,sec_len*4);

            item.InitAdler16(pwords+6, 2);
            pwords = (uint8_t *)wordbuf;
            item.UpdateAdler16(pwords+8, 4*words_to_write-8);
            
            memcpy(wordbuf, &item, 4*dsz);

            
            storage.Write(wordbuf, words_to_write, status.first_free_offset,(1&status.active_page));

            rec = {
                .ID=item.ID,
                .item = reinterpret_cast<const DataItem *>(storage.Data()+
                                        (1&status.active_page)*storage.PageSize()+status.first_free_offset),
                .page = status.active_page
            };
            status.first_free_offset += wordlength;
            status.last_used_ID += 1;
        }
        return rec;
    }

    void Layout::Compact(){
        uint32_t new_page = status.active_page + 1;
        const uint32_t *optr = storage.Data()+(1&status.active_page)*storage.PageSize();
        uint32_t page_id = *optr++;
        const DataItem *item = reinterpret_cast<const DataItem *>(optr);
        uint32_t new_first_free_offs = 1;
        // Erase the new page
        storage.ErasePage(1&new_page);
        // Transfer all good records 
        const uint32_t *end = storage.Data() + ((1&status.active_page)+1)*storage.PageSize();
        while (optr < end && item->ID != NOT_FOUND){
            uint32_t reclen = sizeof(DataItem)/sizeof(uint32_t)+item->length;
            if (item->CheckAdler16()){
                ;
                if (item->ID > 0){
                    // We have a good active record - move it
                    storage.Write(optr,reclen,new_first_free_offs,1&new_page);
                    new_first_free_offs += reclen;
                }
            }
            // Trust the length field - it's all we've got
            optr += reclen;   
            item = reinterpret_cast<const DataItem *>(optr);         
        }
        // Done moving objects
        status.first_free_offset = new_first_free_offs;
        page_id += 1;
        // Write the new page ID and erase the old page
        storage.Write(&page_id,1,0,1&new_page);
        storage.ErasePage(1&status.active_page);
        status.active_page = new_page;
    }

    uint32_t Layout::GetFreeSpace(){
        return storage.PageSize()-status.first_free_offset;
    }

    uint32_t Layout::GetLastUsedID(){
        return status.last_used_ID;
    }

    void Layout::Status::print() const {        
        printf("First free offset: %d\nLast used ID: %d\nActive page: %d\n\n",first_free_offset,last_used_ID,active_page);
    }
} // namespace FDB
