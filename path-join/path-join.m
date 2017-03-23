#include <Foundation/Foundation.h>

int main(void)
{
    NSArray *components = [NSArray arrayWithObjects:@"foo/", @"bar/", @"buuxometer/", @"hi.jpg", nil];
    NSString *path = [NSString pathWithComponents:components];
    NSLog(@"Joined path is  %@\n", path);
    return 0;
}
