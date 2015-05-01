//
//  FacebookManager.m
//  Q
//
//  Created by Noga badhav on 22/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import "FacebookManager.h"
#import "MainQ.h"

@interface FacebookManager ()

@property (nonatomic, strong) MainQ* mainQ;

@end

@implementation FacebookManager

+(instancetype)instance:(MainQ*)mainQ
{
    static FacebookManager* instance = nil;
    static dispatch_once_t onceToken;
	
	dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.mainQ = mainQ;
	});
	
	return instance;
    
}

-(void)connect
{
    self.logoutView = [[FBLoginView alloc] init];
    self.logoutView.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    self.logoutView.delegate = self;
}

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
    self.logoutView = loginView;
    self.logoutView.delegate = nil;
    [self.mainQ connectedFacebook:loginView];
}

@end
