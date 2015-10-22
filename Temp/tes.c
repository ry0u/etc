#include <stdio.h>

int main(void) {
    int a[2][2] = { {100,4} , {1244,30987} };
    int i;

    for(i = 0; i < 4; i ++) {
        printf("%d\n", (*a)[i]);
    }

    return 0;
}
