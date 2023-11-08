#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void swap(int* const a, int* const b)
{
    const int temp = *a;
    *a = *b;
    *b = temp;
}

void inputArray(int* const arr, const int n)
{
    for (int i = 0; i < n; ++i) {
        scanf("%d", &arr[i]);
    }
}

void printArray(int* const arr, const int n)
{
    for (int i = 0; i < n; ++i) {
        printf("%d ", arr[i]);
    }
}

/* BUBBLE SORT */
void bubbleSort(int* const arr, const int n)
{
    for (int i = n - 1; i >= 0; ++i) {
        int swapped = 0;
        for (int j = 0; j < n; ++j) {
            if (arr[j + 1] < arr[j]) {
                swap(&arr[j + 1], &arr[j]);
                swapped = 1;
            }
        }

        if (!swapped) {
            return;
        }
    }
}

int main(int argc, char* argv[])
{
    int n;
    printf("input size of array: ");
    scanf("%d", &n);
    int arr[n];
    inputArray(arr, n);

    bubbleSort(arr, n);

    printArray(arr, n);
    return 1;
}
