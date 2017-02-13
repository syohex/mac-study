#include <Foundation/Foundation.h>

int main(void)
{
    NSString *path = [[NSBundle mainBundle] executablePath];
    NSLog(@"path=%@", path);
    return 0;
}
