#include <Foundation/Foundation.h>

int main(int argc, char *argv[])
{
    if (argc < 2) {
        NSLog(@"Usage: a.out string");
        return 1;
    }

    NSString *str = [NSString stringWithUTF8String: argv[1]];
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64 = [data base64EncodedStringWithOptions: 0];
    NSLog(@"orig=%@, base64=%@", str, base64);
    return 0;
}
