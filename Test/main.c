
#include <stdio.h>

extern int test(int);

extern int sum_test(char numbers[], int length);

extern int convert_test(const char *input_string);

int main(int argc, char* argv[])
{

    int a = 10;
    
    int b = test(a);

    printf("b=%d\n", b);


    // string to int conversion test
    const char * test_string_input = "10240";
    //const char * test_string_input = "0";

    int test_output = convert_test(test_string_input);

    printf("test_output = %d\n", test_output);


    //


    const int length = 10;
    char numbers[length];
    for(int i = 0; i < length; ++ i)
    {
        numbers[i] = i;
    }

    int sum = sum_test(numbers, length);

    return 0;
}