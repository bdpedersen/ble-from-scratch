#ifndef __ERR_HANLDER
#define __ERR_HANDLER

#include <nrf.h>
#include <nrf_nvic.h>
#include <stdio.h>

void fault_handler(uint32_t id, uint32_t pc, uint32_t info);
void print_err(const char* file, int line, int err);
void report_err(const char* file, int line, const char* msg);


#ifdef DEBUG
#define CHK(x,msg) if(!(x)) do{report_err(__FILE__,__LINE__,msg); while(1);} while(0)
#define CHK_ERR(x) do{int _err_ = x; if (_err_ != NRF_SUCCESS){print_err(__FILE__,__LINE__,_err_); while(1);}} while(0)
#define REPORT_ERR(x) do{report_err(__FILE__,__LINE__,x); while(1);} while(0)
#define INFO(x) printf("INFO: %s:%d: %s\n",__FILE__,__LINE__,x)
#define INFO1(x,i) do{ char _str[80]; sprintf(_str,x,i); INFO(_str);}while(0)

#else
#define CHK(x,msg)
#define CHK_ERR(x) if (x != NRF_SUCCESS) sd_nvic_SystemReset()
#define REPORT_ERR(x) sd_nvic_SystemReset()
#define INFO(x)
#define INFO1(x,i)
#endif

#endif