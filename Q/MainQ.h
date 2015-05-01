//
//  MainQ.h
//  Q
//
//  Created by Noga badhav on 22/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "User.h"

@interface MainQ : UIViewController

@property (nonatomic, strong) User *user;
@property (nonatomic, strong) FBLoginView* logoutView;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *profileView;
@property (weak, nonatomic) IBOutlet UILabel *name;
- (IBAction)profileClicked:(id)sender;
-(void)connectedFacebook:(FBLoginView*)logoutView;

@end
