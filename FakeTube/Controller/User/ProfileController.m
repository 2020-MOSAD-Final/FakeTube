#import "ProfileController.h"

@implementation ProfileController {
    NSString* token;
}

-(id) InitWithToken:(NSString *)newToken {
    token = newToken;
    return self;
}

@end
