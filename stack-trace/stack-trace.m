#include <Foundation/Foundation.h>

static void func3(void)
{
    NSLog(@"%@", [NSThread callStackSymbols]);
}

static void func2(void)
{
    func3();
}

static void func1(void)
{
    func2();
}

int main(void)
{
    func1();
    return 0;
}
