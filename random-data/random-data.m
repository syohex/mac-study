#import <Foundation/Foundation.h>
#import <CoreFoundation/CFData.h>
#import <CommonCrypto/CommonCryptor.h>

int main(void)
{
    uint8_t key_data[kCCKeySizeAES256];
    int ret = SecRandomCopyBytes(kSecRandomDefault, kCCKeySizeAES256, key_data);
    if (ret != 0) {
        return 1;
    }

    size_t i;
    for (i = 0; i < kCCKeySizeAES256; ++i) {
        printf("%d\n", key_data[i]);
    }

    return 0;
}
