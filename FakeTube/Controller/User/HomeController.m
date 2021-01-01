#import "HomeController.h"
#import "User.h"

@class UserProfileView;

@implementation HomeController {
    NSString* token;
    UIView* myView;
}

-(id) initWithToken:(NSString *)Token {
    self = [super init];
    token = Token;
    return self;
}

-(void) viewDidLoad {
    [super viewDidLoad];
    
    myView = [UIView new];
}

-(void) refresh {
    [self FetchData: @"user"
            methods: FETCHGET
            headers: @{
                @"Authorization": token
            }
            params: nil
    callback:^(NSDictionary* dict){
        NSLog(@"%@", [self dictToString: dict]);
        
        User* user = [[User alloc] initWithDict: dict];
        
    }];
}

@end
