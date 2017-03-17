#include <Foundation/Foundation.h>

int main(void)
{
    NSOperatingSystemVersion version = [NSProcessInfo. processInfo operatingSystemVersion];
    NSLog(@"Major version %ld", version.majorVersion);
    NSLog(@"Minor version %ld", version.minorVersion);
    NSLog(@"Patch version %ld", version.patchVersion);
    return 0;
}
