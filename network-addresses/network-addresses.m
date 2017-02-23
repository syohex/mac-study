#include <Foundation/Foundation.h>

int main(void)
{
    NSArray *addresses = [[NSHost currentHost] addresses];
    for (NSString *address in addresses) {
        NSLog(@"stringAddress is %@", address);
    }
    return 0;
}
