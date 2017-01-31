#include <Foundation/Foundation.h>

// clang -framework Foundation
int main(void)
{
    NSTimeInterval uptime = [[NSProcessInfo processInfo] systemUptime];

    NSLog(@"uptime=%ld seconds\n", (long)uptime);
    return 0;
}