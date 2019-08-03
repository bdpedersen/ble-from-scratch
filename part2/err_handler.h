#ifndef __ERR_HANLDER
#define __ERR_HANDLER

#include <nrf.h>
#include <nrf_nvic.h>

void fault_handler(uint32_t id, uint32_t pc, uint32_t info);
void print_err(const char* file, int line, int err);
void report_err(const char* file, int line, const char* msg);


#ifdef DEBUG
#define CHK_ERR(x) do{int _err_ = x; if (_err_ != NRF_SUCCESS){print_err(__FILE__,__LINE__,_err_); sd_nvic_SystemReset();}} while(0)
#define REPORT_ERR(x) do{report_err(__FILE__,__LINE__,x); sd_nvic_SystemReset();} while(0)
#define INFO(x) printf(__FILE__":%d: "x"\n",__LINE__)
#else
#define CHK_ERR(x) if (x != NRF_SUCCESS) sd_nvic_SystemReset()
#define REPORT_ERR(x) sd_nvic_SystemReset()
#define INFO(x)
#endif

#endif