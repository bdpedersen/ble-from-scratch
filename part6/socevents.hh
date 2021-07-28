#ifndef __SOCEVENTS_HH
#define __SOCEVENTS_HH

#include "../../eventhandler/eventhandler.hh"
#include <nrf_soc.h>

namespace bfs{
  class SoCEvents {
  public:
    static void install(EventHandler<enum NRF_SOC_EVTS>& handler);
    static void handle_all();
    static void waitfor(enum NRF_SOC_EVTS event);
    static uint32_t waitfor(enum NRF_SOC_EVTS event1, enum NRF_SOC_EVTS event2);
    
  private:
    static EventHandler<enum NRF_SOC_EVTS> eh;
  };
    
}

#endif
