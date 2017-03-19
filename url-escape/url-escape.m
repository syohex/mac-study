#include <Foundation/Foundation.h>

int main(void)
{
    NSString *str = @"## hello world ##";
    NSString *escaped = [str stringByAddingPercentEncodingWithAllowedCharacters: [NSCharacterSet URLHostAllowedCharacterSet]];
    NSString *unescaped = escaped.stringByRemovingPercentEncoding;
    NSLog(@"orig=%@, escaped=%@, unescaped=%@", str, escaped, unescaped);
    return 0;
}
