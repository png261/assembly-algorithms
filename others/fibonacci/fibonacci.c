#include <stdio.h>

int main()
{
    const char* input = "Input n: ";
    const char* scanNumber = "%d";
    const char* printNumber = "%d \n";

    printf("%s", input);
    int n = 0;
    scanf(scanNumber, &n);

    int pre = 0;
    int cur = 1;
    while (n--) {
        printf(printNumber, pre);
        cur = cur + pre;
        pre = cur - pre;
    }
}
