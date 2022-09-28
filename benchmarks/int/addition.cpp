#include <stdlib.h>
#include <time.h>

int main () {
    srand(time(NULL));

    int adder = 0;

    for(int i =0; i < 10000; i++){
        adder += rand() % 1000;
        adder = 0;
    }

    return 0;
}