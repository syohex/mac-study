#include <Foundation/Foundation.h>

int main(void)
{
    NSError *err;
    BOOL ret = [[NSFileManager defaultManager]
                   createDirectoryAtPath: @"foo/bar"
                   withIntermediateDirectories: YES
                              attributes: nil error: &err];
    if (ret == NO)
        NSLog(@"Error is %ld[domain=%@]\n", [err code], [err domain]);
    else
        NSLog(@"Success creating directory: %@", @"foo/bar");
    return 0;
}
