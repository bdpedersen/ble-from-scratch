#include "loops.hh"
#include <iostream>
#include <cstdint>

void fill(uint8_t (&A)[5][5]){
  Loop2D<4,4>::run([&](int x, int y){A[x][y]=x+5*y;});
}



int main(void){
  uint8_t B[5][5];

  fill(B);

  for (int x=0; x < 5; x++){
    for (int y=0; y < 5; y++){
      std::cout << (int)B[x][y] << std::endl;
    }
  }
}
