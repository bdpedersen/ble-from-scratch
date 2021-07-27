#ifndef __EVENTHANDLER_HH
#define __EVENTHANDLER_HH

#ifdef DEBUG_PRINT
#include <iostream>
#endif

namespace bfs {

  template <typename T>
  class EventHandler {
  public:
    EventHandler() : handler(this){}
    
    void install(EventHandler<T>& handler){
      handler.handler = this->handler;
      this->handler = &handler;
    }

    void fire(const T& event){
      if (!handler->handle(event))
	handler->fire(event);
    }

    // return true if the event was handled, otherwise false
    virtual bool handle(const T& event){
      #ifdef DEBUG_PRINT
      std::cout << "Unhandled event " << event << std::endl;
      #endif
      return true;
    }

  private:
    EventHandler<T> *handler;
  };
}

#endif
