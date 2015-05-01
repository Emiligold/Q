//
//  FacebookConnection.m
//  Q
//
//  Created by Noga badhav on 21/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import "FacebookConnection.h"

@interface FacebookConnection ()

@property (nonatomic, strong) id viewController;

@end

@implementation FacebookConnection

+(instancetype)instance:(id)viewController
{
    static FacebookConnection* instance = nil;
    static dispatch_once_t onceToken;
	
	dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.viewController = viewController;
	});
	
	return instance;
}

-(FBLoginView*)startConnection
{
    self.loginView = [[FBLoginView alloc] init];
    self.loginView.delegate = self;
    self.loginView.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    self.loginView.center = CGPointMake(160, 220);
    
    return self.loginView;
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    static BOOL connected = NO;
    
    if (!connected)
    {
        connected = YES;
        //NSLog(@"%@", user);
        //[DBServices setCurrFacebookUser:user];
        //self.profileID = user.objectID;
        // Create session with user
        //NSString *userMail = [user objectForKey:@"email"];
        //[self.appDelegate ConnectedToFacebook:user.name userPassword:user.objectID
         //                            userMail:userMail loginView:self.loginView];
    }
}

@end
