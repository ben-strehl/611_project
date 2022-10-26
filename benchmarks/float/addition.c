#include <stdlib.h>
#include <time.h>

int main () {
    srand(time(NULL));

    float adder = 0.0;

    for(int i =0; i < 10000; i++){
        adder += (rand() / ((RAND_MAX / 1000.0)));
        adder = 0.0;
    }

    return 0;
}
