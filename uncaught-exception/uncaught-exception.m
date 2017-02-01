#include <Foundation/Foundation.h>

static void exceptionHandler(NSException *exception)
{
    NSString *trace = [[exception callStackReturnAddresses] componentsJoinedByString:@"\n"];
    NSLog(@"Stack: (\n%@\n)", trace);
}

static void nullPointerException()
{
    volatile unsigned int *a = NULL;
    *a = 0xdeadbeef;
}

static void throwException()
{
    [[NSException exceptionWithName:@"NSstring" reason:@"NSstring" userInfo:nil] raise];
}

int main(void)
{
    NSSetUncaughtExceptionHandler(&exceptionHandler);

    if (0) { // not work
        nullPointerException();
        return 1;
    }

    if (1) { // work
        throwException();
    }

    return 0;
}
