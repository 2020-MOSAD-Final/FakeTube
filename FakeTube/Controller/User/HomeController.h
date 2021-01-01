#ifndef HomeController_h
#define HomeController_h

#import <UIKit/UIKit.h>
#import "ViewController.h"

@class User;

@interface HomeController : ViewController

-(id) initWithToken: (NSString*) token;

-(void) refresh;

@end

#endif /* HomeController_h */
