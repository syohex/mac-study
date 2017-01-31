#include <Foundation/Foundation.h>

int main(void)
{
    NSString *username = NSUserName();

    NSLog(@"Username is %@\n", username);
    return 0;
}
