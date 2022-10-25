#include <stdlib.h>
#include <time.h>

int main () {
    srand(time(NULL));

    int subtractor = 1000;

    for(int i = 0; i < 10000; i++) {
        subtractor -= rand() % 1000;
        subtractor = 1000;
    }

    return 0;
}
