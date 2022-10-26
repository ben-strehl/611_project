#include <stdlib.h>
#include <time.h>

int main () {
    srand(time(NULL));

    float subtractor = 1000.0;

    for(int i =0; i < 10000; i++){
        subtractor += (rand() / (  (RAND_MAX / 1000.0)));
        subtractor = 1000.0;
    }

    return 0;
}
