#include <stdio.h>

const char* inputA = "inputA: ";
const char* inputB = "inputB: ";
const char* inputFormat = "%d";
const char* output = "LCM: %d";

int gcd(int a, int b)
{
    if (b == 0) {
        return a;
    }
    return gcd(b, a % b);
}

int lcm(const int a, const int b)
{
    return a / gcd(a, b) * b;
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
    printf(output, lcm(a, b));
}
