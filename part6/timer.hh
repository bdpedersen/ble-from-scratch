#ifndef __TIMER_HH
#define __TIMER_HH

#include <nrf52.h>

// Microsecond resolution timer 
class HWTimer {
public:
  HWTimer(NRF_TIMER_Type *timer) : timer(timer){
    timer->PRESCALER = 4;
    timer->MODE=0;
    timer->BITMODE=3;
  }
  void start(){
    timer->TASKS_CLEAR = 1;
    timer->TASKS_START = 1;
  }

  void stop(){
    timer->TASKS_STOP = 1;
  }

  uint32_t read(){
    timer->TASKS_CAPTURE[0]=1;
    return timer->CC[0];
  }

private:
  NRF_TIMER_Type *timer;
};


#endif
