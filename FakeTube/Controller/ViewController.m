#import <AFNetworking/AFNetworking.h>
#import "ViewController.h"
#define BASEURL @"http://159.75.1.231:5009/"

@implementation ViewController

-(void) FetchData: (NSString*) url
          methods: (int) method
          headers: (NSDictionary*) headers
           params: (NSDictionary*) params
         callback:(void(^)(NSDictionary* dict)) callback{
    NSString* absUrl = [[NSString alloc] initWithFormat:@"%@%@", BASEURL, url];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects: @"application/json", @"text/json", @"text/javascript", nil];
    
    if(method==FETCHPOST){
        [manager POST: absUrl
           parameters: params
            headers: headers
            progress: nil
            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                callback(responseObject);
            }
            failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"Error");
        }];
    }
    else if(method==FETCHGET){
        [manager GET: absUrl
           parameters: params
            headers: headers
            progress: nil
            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                callback(responseObject);
            }
            failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                // NSLog(@"%@",[self dictToString: error]);
                NSLog(@"Error");
        }];
    }
}

-(NSString*) dictToString:(NSDictionary*) dict {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject: dict
                                                       options:NSJSONWritingPrettyPrinted
                                                         error: nil];
    NSString * stringResult = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return stringResult;
}

@end
