#include <stdlib.h>
#include <time.h>

int main () {
    srand(time(NULL));

    int divider = 1000;

    for(int i = 0; i < 10000; i++) {
        divider /= rand() % 1000 + 1;
        divider = 1000;
    }

    return 0;
}
