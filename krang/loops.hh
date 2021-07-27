// Templates for looping a function over 1D or 2D
template<int x>
class Loop1D{
public:
  template <class Functor>
  static inline void run(Functor f){
    f(x);
    Loop1D<x-1>::run(f);
  }
};

template<>
class Loop1D<0>{
public:
  template <class Functor>
  static inline void run(Functor f){
    f(0);
  }
};



template<int x, int y, int xinit>
class _Loop2D{
public:
  template <class Functor>
  static inline void run(Functor f){
    f(x,y);
    _Loop2D<x-1, y, xinit>::run(f);
  }
};



template<int y, int xinit>
class _Loop2D<0,y,xinit>{
public:
  template <class Functor>
  static inline void run(Functor f){
    f(0,y);
    _Loop2D<xinit, y-1, xinit>::run(f);
  }
};

template<int xinit>
class _Loop2D<0,0,xinit>{
public:
  template <class Functor>
  static inline void run(Functor f){
    f(0,0);
  }
};

template<int x, int y>
class Loop2D{
public:
  template <class Functor>
  static inline void run(Functor f){
    f(x,y);
    _Loop2D<x-1, y, x>::run(f);
  }
};


