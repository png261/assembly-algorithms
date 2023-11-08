#include <stdio.h>

const char* inputA = "Input a: ";
const char* inputR = "Input r: ";
const char* inputN = "Input n: ";
const char* inputFormat = "%d";
const char* output = "%d\n";

void printGeometricSequence(const int a, const int r, const int n)
{
    int cur = a;
    for (int i = 0; i < n; ++i) {
        printf(output, cur);
        cur *= r;
    }
}

void prompt(const char* str, int* a)
{
    printf("%s", str);
    scanf(inputFormat, a);
}

int main(int argc, char* argv[])
{
    int a;
    int r;
    int n;

    prompt(inputA, &a);
    prompt(inputR, &r);
    prompt(inputN, &n);

    printGeometricSequence(a, r, n);
    return 1;
}
