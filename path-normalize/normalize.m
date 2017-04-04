#include <Foundation/Foundation.h>

int main(void)
{
    NSString *path = @"~/tmp/../local/foo/bar.txt";
    NSString *normalized = path.stringByStandardizingPath;
    NSLog(@"normalize path is %@(orig=%@)\n", normalized, path);
    return 0;
}
