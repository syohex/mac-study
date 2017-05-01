#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>
#include <Security/Security.h>

#include <stdio.h>

int main(void)
{
    int fd = open("private.der", O_RDONLY);
    if (fd == -1) {
        perror("open");
        return -1;
    }

    char buf[4096];
    ssize_t size = read(fd, buf, sizeof(buf));
    if (size == -1) {
        perror("read");
        return -1;
    }

    NSData *data = [NSData dataWithBytes: buf length: size];
    NSDictionary *dict = @{
        (__bridge id)kSecAttrKeyType : (__bridge id)kSecAttrKeyTypeRSA,
        (__bridge id)kSecAttrKeyClass : (__bridge id)kSecAttrKeyClassPrivate,
        (__bridge id)kSecAttrKeySizeInBits: @1024
    };

    CFErrorRef error = NULL;
    SecKeyRef key = SecKeyCreateFromData((__bridge CFDictionaryRef)dict, (__bridge CFDataRef)data, &error);
    if (error != NULL) {
        NSLog(@"failed create key %@", (__bridge NSError*)error);
        return -1;
    }

    printf("@@ Success\n");
    return 0;
}
