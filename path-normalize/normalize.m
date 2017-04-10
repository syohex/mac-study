#include <Foundation/Foundation.h>
#include <stdlib.h>

int main(void)
{
    NSString *path = @"~/tmp/../local/foo/bar.txt";
    NSString *normalized = path.stringByStandardizingPath;
    NSLog(@"normalize path is %@(orig=%@)\n", normalized, path);

    const char *cpath = "../../../perl/msgpack-perl";
    char cnormalized[PATH_MAX];
    realpath(cpath, cnormalized);
    printf("normalize path is %s(orig=%s)%d\n", cnormalized, cpath, PATH_MAX);
    return 0;
}
