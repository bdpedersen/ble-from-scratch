// Implementation of the keccak sponge function using templates
#ifndef __SPONGE_H
#define __SPONGE_H

#include <cstdint>
#include <iostream>
#include "loops.hh"
#include "templates.hh"

namespace krang {
  template <typename T>
  class Sponge {
  protected:
    static int constexpr rix[5][5]={
	{0,36,3,41,18},
	{1,44,10,45,2},
	{62,6,43,15,61},
	{28,55,25,21,56},
	{27,20,39,8,14},
      };

    static uint64_t constexpr RC[24] = {
      0x0000000000000001ULL,
      0x0000000000008082ULL,
      0x800000000000808AULL,
      0x8000000080008000ULL,
      0x000000000000808BULL,
      0x0000000080000001ULL,
      0x8000000080008081ULL,
      0x8000000000008009ULL,
      0x000000000000008AULL,
      0x0000000000000088ULL,
      0x0000000080008009ULL,
      0x000000008000000AULL,
      0x000000008000808BULL,
      0x800000000000008BULL,
      0x8000000000008089ULL,
      0x8000000000008003ULL,
      0x8000000000008002ULL,
      0x8000000000000080ULL,
      0x000000000000800AULL,
      0x800000008000000AULL,
      0x8000000080008081ULL,
      0x8000000000008080ULL,
      0x0000000080000001ULL,
      0x8000000080008008ULL
    };


    
  protected:
    void keccak_p(T rc){
      T C[5];
      T D[5];
      T B[5][5];

      
      // A is transposed in the following since the algorithm on keccak.team
      // assumes column-major data when translating from matrix to vector
      // form for the state.
      
      Loop1D<4>::run([&](unsigned x){
	C[x] = A[0][x]^A[1][x]^A[2][x]^A[3][x]^A[4][x];
      });

      Loop1D<4>::run([&](unsigned x){
	// Note: Paper says x-1 but that gives the wrong result when
	// the compiler translates this due to -1%5 != 4 !
	D[x] = C[(x+4)%5] ^ rol<T>(C[(x+1)%5],1);
      });

      Loop2D<4,4>::run([&](unsigned x, unsigned y){
	A[y][x] ^= D[x];
      });

      
      Loop2D<4,4>::run([&](unsigned x, unsigned y){
	  B[y][(2*x+3*y)%5] = rol<T>(A[y][x], rix[x][y]);
      });
      
      
      Loop2D<4,4>::run([&](unsigned x, unsigned y){
	A[y][x]=B[x][y] ^ ((~B[(x+1)%5][y]) & B[(x+2)%5][y]);
      });

      A[0][0] ^= rc;
    }
    
    void keccak_f(){
      for (unsigned i=0; i < rounds<T>(); i++){
	keccak_p((T)RC[i]);
      }
    }

    T A[5][5]={{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0}};

  };
}

#endif
