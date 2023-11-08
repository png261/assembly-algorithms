#include <stdio.h>

const char* inputA = "Input a: ";
const char* inputD = "Input d: ";
const char* inputN = "Input n: ";
const char* inputFormat = "%d";
const char* output = "%d\n";

void printArithmeticSequence(const int a, const int d, const int n)
{
    int cur = a;
    for (int i = 0; i < n; ++i) {
        printf(output, cur);
        cur += d;
    }
}

void promptInt(const char* str, int* a)
{
    printf("%s", str);
    scanf(inputFormat, a);
}

int main(int argc, char* argv[])
{
    int a;
    int d;
    int n;

    promptInt(inputA, &a);
    promptInt(inputD, &d);
    promptInt(inputN, &n);

    printArithmeticSequence(a, d, n);
    return 1;
}
