#include <Foundation/Foundation.h>
#include <new>
#include <cstdlib>
#include <iostream>

static void exceptionHandler(NSException *exception)
{
    NSString *trace = [[exception callStackReturnAddresses] componentsJoinedByString:@"\n"];
    NSLog(@"Stack: (\n%@\n)", trace);exit(1);
}

static void nullPointerException()
{
    volatile unsigned int *a = NULL;
    *a = 0xdeadbeef;
}

static void throwException()
{
    throw std::bad_alloc();
    //[[NSException exceptionWithName:@"NSstring" reason:@"NSstring" userInfo:nil] raise];
}

int main(void)
{
    NSSetUncaughtExceptionHandler(&exceptionHandler);

    if (0) { // not work
        nullPointerException();
        return 1;
    }

    if (1) { // work
try {
        throwException();
} catch(std::bad_alloc& e) { std::cerr << "moz:" << e.what() << std::endl;}
    }

    return 0;
}
