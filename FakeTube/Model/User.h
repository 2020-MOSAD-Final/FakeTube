#ifndef User_h
#define User_h

@interface User : NSObject

@property NSString* username;
@property NSString* bio;
@property NSString* following;
@property NSString* followers;
@property NSString* icon;

-(id) initWithDict:(NSDictionary*) dict;

@end

@implementation User

-(id) initWithDict:(NSDictionary*) dict {
    _username = dict[@"username"];
    _bio = dict[@"bio"];
    _following = dict[@"followingNum"];
    _followers = dict[@"followerNum"];
    _icon = dict[@"avatar"];
    return self;
}

@end

#endif /* User_h */
