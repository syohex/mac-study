#include <Foundation/Foundation.h>

int main(void)
{
    NSURL *url=[NSURL URLWithString:@"https://syohex.org"];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"GET"];

    NSError *error;
    NSURLResponse *resp;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&resp error:&error];

    NSString *data=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    NSLog(@"## %@", data);
    return 0;
}
