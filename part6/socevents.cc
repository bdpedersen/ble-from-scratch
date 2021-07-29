#include "socevents.hh"


bfs::EventHandler<enum NRF_SOC_EVTS> bfs::SoCEvents::eh;

void bfs::SoCEvents::install(bfs::EventHandler<enum NRF_SOC_EVTS>& handler){
  eh.install(handler);
}

void bfs::SoCEvents::handle_all(){
  uint32_t v;
    while (NRF_ERROR_NOT_FOUND != sd_evt_get(&v)){
      eh.fire((enum NRF_SOC_EVTS)v);
    }
}

enum NRF_SOC_EVTS bfs::SoCEvents::waitfor(enum NRF_SOC_EVTS event1, enum NRF_SOC_EVTS event2){
  bool found = false;
  enum NRF_SOC_EVTS fevt;
  while (!found){
    uint32_t v;
    while (NRF_ERROR_NOT_FOUND != sd_evt_get(&v)){
      if (v == event1 || v == event2){
	found = true;
	fevt = (enum NRF_SOC_EVTS)v;
      }else{
	eh.fire((enum NRF_SOC_EVTS)v);
      }
    }
    if (!found){
      sd_app_evt_wait();
    }
  }
  return fevt;
}

void bfs::SoCEvents::waitfor(enum NRF_SOC_EVTS event){
  bool found = false;
  while(!found){
    uint32_t v;
    while (NRF_ERROR_NOT_FOUND != sd_evt_get(&v)){
      if (v == event) found = true;
      else eh.fire((enum NRF_SOC_EVTS)v);
    }
    if (!found){
      sd_app_evt_wait();    
    }
  }
}
