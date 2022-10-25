#include <stdlib.h>
#include <time.h>

int main () {
    srand(time(NULL));

    int multiplier = 3;

    for(int i = 0; i < 10000; i++) {
        multiplier *= rand() % 1000;
        multiplier = 3;
    }

    return 0;
}
