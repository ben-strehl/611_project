#include <stdlib.h>
#include <time.h>

#define SIZE 500

int main () {
    srand(time(NULL));

    int* A = malloc((size_t)(sizeof(int)*SIZE*SIZE));
    int* B = malloc((size_t)(sizeof(int)*SIZE*SIZE));
    int* C = malloc((size_t)(sizeof(int)*SIZE*SIZE));

    for(int i =0; i < SIZE; i++){
        for(int j = 0; j < SIZE; j++){
            for(int k = 0; k < SIZE; k++){
                A[i+k*SIZE] = rand() / (RAND_MAX / 1000.0) + 1;
                B[k*SIZE+j] = rand() / (RAND_MAX / 1000.0) + 1;
                C[i+j*SIZE] = A[i+k*SIZE] / B[k*SIZE+j];
            }
        }
    }

    return 0;
}