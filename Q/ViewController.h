//
//  ViewController.h
//  Q
//
//  Created by Noga badhav on 21/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface ViewController : UIViewController <FBLoginViewDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet FBLoginView *loginView;

@property (weak, nonatomic) IBOutlet UIButton *skipButton;

- (IBAction)connectFacebookClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *connectFacebook;

@property (weak, nonatomic) IBOutlet UIView *skipContainer;

- (IBAction)tapped:(id)sender;

-(void)skipViewExitClicked;

@property (weak, nonatomic) IBOutlet UIImageView *image;

-(void)continueClicked:(id)sender;

@end
