#include <Foundation/Foundation.h>

int main(int argc, char *argv[])
{
    if (argc < 2) {
        NSLog(@"Usage: a.out string");
        return 1;
    }

    NSString *s = [NSString stringWithUTF8String: argv[1]];
    NSData *d = [[NSData alloc] initWithBase64EncodedString: s options:0];
    NSString *plain = [[NSString alloc] initWithData: d encoding: NSUTF8StringEncoding];
    NSLog(@"orig=%@, plain=%@", s, plain);
    return 0;
}
