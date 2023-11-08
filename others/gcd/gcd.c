#include <stdio.h>

const char* inputA = "inputA: ";
const char* inputB = "inputB: ";
const char* inputFormat = "%d";
const char* output = "GCD: %d";

int gcd(int a, int b)
{
    if (b == 0) {
        return a;
    }
    return gcd(b, a % b);
}

void promptInt(const char* str, int* a)
{
    printf("%s", str);
    scanf(inputFormat, a);
}

int main()
{
    int a;
    int b;
    promptInt(inputA, &a);
    promptInt(inputB, &b);
    printf(output, gcd(a, b));
}
