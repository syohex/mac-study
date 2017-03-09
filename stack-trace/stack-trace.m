#include <Foundation/Foundation.h>
#include <signal.h>

static void sighandler(int signo)
{
    NSLog(@"%@", [NSThread callStackSymbols]);
    _exit(1);
}

static void func3(void)
{
    volatile int *a = NULL;
    *a = 0xdeadbeef;
    for (NSString *ns in [NSThread callStackSymbols]) {
        NSLog(@"%@", ns);
    }
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
    signal(SIGSEGV, sighandler);

    func1();
    return 0;
}
