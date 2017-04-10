#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>

NSData *hmacSHA256(NSString *ns_key, NSString *ns_data)
{
    const char *key  = [ns_key UTF8String];
    const char *data = [ns_data UTF8String];
    unsigned char hmac[CC_SHA256_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA256, key, strlen(key), data, strlen(data), hmac);
    NSData *ret = [[NSData alloc] initWithBytes:hmac length:sizeof(hmac)];
    return ret;
}

int main (int argc, const char * argv[])
{
    NSData *data = hmacSHA256(@"secret", @"hello world");
    NSLog(@"key=secret, data='hello world', hmacsha256=%s\n", data.bytes);
    return 0;
}
