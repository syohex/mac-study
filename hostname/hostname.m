#include <Foundation/Foundation.h>

int main(void)
{
    NSString *hostname = [[NSHost currentHost] name];

    NSLog(@"hostname is %@\n", hostname);
    return 0;
}
