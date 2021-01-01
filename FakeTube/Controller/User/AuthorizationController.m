#import "AuthorizationController.h"
#import "Helper.h"
#import "FakeNetworking.h"
#import "HomeController.h"

@implementation AuthorizationController {
    UITextView* username;
    UITextView* password;
}

-(void) viewDidLoad{
    [super viewDidLoad];
    
    // username and password input
    float textWidth = 200;
    float textHeight = 25;
    
    CGRect usernameRect = CGRectMake(GetCenterLeft(textWidth, textHeight),
                                     GetCenterTop(textWidth, textHeight),
                                     textWidth,textHeight);
    UITextView* usernameTextView = [[UITextView alloc]
                                  initWithFrame:usernameRect];
    [usernameTextView setDelegate: self];
    usernameTextView.textContainer.maximumNumberOfLines = 0;
    usernameTextView.autocorrectionType = UITextAutocorrectionTypeNo;
    usernameTextView.autocapitalizationType = UITextAutocapitalizationTypeNone;
    usernameTextView.layer.borderColor = [UIColor grayColor].CGColor;
    usernameTextView.layer.borderWidth = 1.0;
    username = usernameTextView;
    [self.view addSubview: usernameTextView];
    
    CGRect passwordRect = CGRectMake(GetCenterLeft(textWidth, textHeight),
                                     GetCenterTop(textWidth, textHeight) + textHeight + 10,
                                     textWidth,textHeight);
    UITextView* passwordTextView = [[UITextView alloc]
                                  initWithFrame: passwordRect];
    [passwordTextView setDelegate: self];
    passwordTextView.textContainer.maximumNumberOfLines = 0;
    passwordTextView.autocorrectionType = UITextAutocorrectionTypeNo;
    passwordTextView.autocapitalizationType = UITextAutocapitalizationTypeNone;
    passwordTextView.layer.borderColor = [UIColor grayColor].CGColor;
    passwordTextView.layer.borderWidth = 1.0;
    password = passwordTextView;
    [self.view addSubview: passwordTextView];
    
    // login button
    float buttonWidth = 70;
    float buttonHeight = 15;
    
    CGRect buttonRect = CGRectMake(GetCenterLeft(buttonWidth, buttonHeight),
                                   GetCenterTop(buttonWidth, buttonHeight) + 200,
                                   buttonWidth,buttonHeight);
    
    UIButton* submitButton = [[UIButton alloc]initWithFrame: buttonRect];
    [submitButton setTitle:@"login" forState:UIControlStateNormal];
    [submitButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
    submitButton.layer.borderColor = [UIColor grayColor].CGColor;
    submitButton.layer.borderWidth = 1.0;
    
    [submitButton addTarget:self
                     action: @selector(login)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: submitButton];
    
    // signup button
    buttonRect = CGRectMake(GetCenterLeft(buttonWidth, buttonHeight),
                                   GetCenterTop(buttonWidth, buttonHeight) + 270,
                                   buttonWidth,buttonHeight);
    
    UIButton* signupButton = [[UIButton alloc]initWithFrame: buttonRect];
    [signupButton setTitle:@"signup" forState:UIControlStateNormal];
    [signupButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
    signupButton.layer.borderColor = [UIColor grayColor].CGColor;
    signupButton.layer.borderWidth = 1.0;
    
    [signupButton addTarget:self
                     action: @selector(signUp)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: signupButton];
}

-(void) login {
    [self FetchData:@"login"
            methods: FETCHPOST
            headers: nil
             params: @{
                 @"username": username.text,
                 @"password": password.text
             }
    callback:^(NSDictionary* dict){
        // NSLog(@"%@",[self dictToString:dict]);
        HomeController* homeController = [[HomeController alloc] initWithToken: dict[@"token"]];
        self.window.rootViewController = homeController;
    }];
}

-(void) signUp {
    [self FetchData:@"signup"
            methods: FETCHPOST
            headers: nil
             params: @{
                 @"username": username.text,
                 @"password": password.text
             }
    callback:^(NSDictionary* dict){
        // NSLog(@"%@",[self dictToString:dict]);
    }];
}



@end
