#ifndef ViewController_h
#define ViewController_h
#import <UIKit/UIKit.h>

#define FETCHGET 0
#define FETCHPOST 1

@interface ViewController : UIViewController

@property UIWindow* window;

-(void) FetchData: (NSString*) url
          methods: (int) method
          headers: (NSDictionary*) headers
           params: (NSDictionary*) params
         callback: (void(^)(NSDictionary* dict)) callback;

-(NSString*) dictToString:(NSDictionary*) dict;

@end

#endif /* ViewController_h */
