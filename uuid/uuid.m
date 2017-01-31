#include <Foundation/Foundation.h>

int main(void)
{
    NSUUID *uuid = [NSUUID UUID];
    NSString *uuidStr = [uuid UUIDString];
    NSLog(@"Username is %@\n", uuidStr);
    return 0;
}
