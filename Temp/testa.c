#include <stdio.h>

int main(void) {
    int a,b,c;
    char c2;
    scanf("%d,%d,%d",&a,&b,&c);
    scanf("%d %c %d",&a,&c2,&b);
    printf("%d %d %d\n",a,b,c);
    return 0;
}
