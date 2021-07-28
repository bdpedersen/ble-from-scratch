#include "socevents.hh"


EventHandler<enum NRF_SOC_EVTS> bfs::SoCEvents::eh;

void bfs::SoCEvents::install(EventHandler<uint32_t>& handler){
  eh.register(handler);
}


enum NRFSOC_EVTS bfs::SoCEvents::waitfor(enum NRF_SOC_EVTS event1, enum NRF_SOC_EVTS event2){
  bool found = false;
  enum NRF_SOC_EVTS fevt;
  do{
    sd_app_evt_wait();
    uint32_t v;
    while (NRF_ERROR_NOT_FOUND != sd_evt_get(&v)){
      if (v == event1 || v == event2){
	found = true;
	fevt = v;
      }else{
	eh.fire(v);
      }
    }
  }while(!found);
  return fevt;
}

void bfs::SoCEvents::waitfor(enum NRF_SOC_EVTS event){
  bool found = false;
  do{
    sd_app_evt_wait();
    uint32_t v;
    while (NRF_ERROR_NOT_FOUND != sd_evt_get(&v)){
      if (v == event) found = true;
      else eh.fire(v);
    }
  }while(!found); 
}
