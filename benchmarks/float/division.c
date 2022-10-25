#include <stdlib.h>
#include <time.h>

int main () {
    srand(time(NULL));

    float divider = 1000.0;

    for(int i =0; i < 10000; i++){
        divider /= static_cast <float> (rand() / (static_cast <float> (RAND_MAX / 1000.0))) + 1.0;
        divider = 1000.0;
    }

    return 0;
}
