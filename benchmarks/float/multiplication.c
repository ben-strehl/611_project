#include <stdlib.h>
#include <time.h>

int main () {
    srand(time(NULL));

    float multiplier = 3.0;

    for(int i =0; i < 10000; i++){
        multiplier /= static_cast <float> (rand() / (static_cast <float> (RAND_MAX / 1000.0)));
        multiplier = 3.0;
    }

    return 0;
}
