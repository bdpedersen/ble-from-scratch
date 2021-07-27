#include <iostream>
#include "eventhandler.hh"


class Handler1 : public bfs::EventHandler<uint32_t> {
  virtual bool handle(const uint32_t& v) override{
    if (v == 1){
      std::cout << "Handler1: Handled event with value 1" << std::endl;
      return true;
    }else{
      std::cout << "Handler1: Passed on event with value " << v << std::endl;
      return false;
    }
  }
} h1;

class Handler2 : public bfs::EventHandler<uint32_t> {
  virtual bool handle(const uint32_t& v) override {
    if (v == 2){
      std::cout << "Handler2: Handled event with value 2" << std::endl;
      return true;
    }else{
      std::cout << "Handler2: Passed on event with value " << v << std::endl;
      return false;
    }
  }
} h2;

bfs::EventHandler<uint32_t> eh;

int main(void){

  std::cout << "Firing events without handlers" << std::endl;
  eh.fire(1);
  eh.fire(2);
  eh.fire(3);

  std::cout << "Firing events with 1 handler" << std::endl;
  eh.install(h1);
  eh.fire(1);
  eh.fire(2);
  eh.fire(3);

  std::cout << "Firing events with 2 handlers" << std::endl;
  eh.install(h2);
  eh.fire(1);
  eh.fire(2);
  eh.fire(3);

}
