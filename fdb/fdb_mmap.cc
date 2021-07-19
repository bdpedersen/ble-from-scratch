#include <memory>
#include "fdb.hh"

namespace FDB
{

    Storage::Storage()
    {
        _baseptr = new uint32_t[2048];
        memset(_baseptr,0xff,sizeof(uint32_t)*2048);

    }

    Storage::~Storage()
    {
        delete[] _baseptr;
    }

    // Return page size in 32bit words
    int Storage::PageSize()
    {
        return 1024;
    }
    // Return pointer for the first page
    const uint32_t *Storage::Data()
    {
        return _baseptr;
    }
    // Write data to the backing store
    int Storage::Write(const uint32_t *src, int len, uint32_t offset, uint8_t page)
    {
        uint32_t *dest = _baseptr;
        dest += page*PageSize();
        dest += offset;
        for (int n=0; n < len; n++) *dest++=*src++;
        return len;
    }

    void Storage::ErasePage(int pageno)
    {
        uint32_t *p = _baseptr + PageSize()*pageno;
        int N=PageSize();
        for (int n=0; n < N; n++) *p++ = 0xffffffffUL;
    }
} // namespace FDB