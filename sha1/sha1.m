#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

int main(int argc, char *argv[])
{
    if (argc < 2) {
        NSLog(@"Usage a.out string");
        return 1;
    }

    NSString *s = [NSString stringWithUTF8String: argv[1]];
    NSData *data = [s dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];

    CC_SHA1(data.bytes, data.length, digest);

    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }

    NSString *sha1 = [NSString stringWithString: output];
    NSLog(@"orig=%@, sha1=%@", s, sha1);

    return 0;
}
