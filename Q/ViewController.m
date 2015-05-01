//
//  ViewController.m
//  Q
//
//  Created by Noga badhav on 21/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import "ViewController.h"
#import "FacebookConnection.h"
#import "User.h"
#import "DBServices.h"
#import "SkipView.h"
#import "MainQ.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *modalView;
@property (nonatomic, strong) SkipView* skipView;
@property (weak, nonatomic) IBOutlet UIButton *questionButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.loginView = [[FBLoginView alloc] init];
    self.loginView.delegate = self;
    self.loginView.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    self.loginView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    self.questionButton.clipsToBounds = YES;
    self.questionButton.layer.cornerRadius = 21;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    User* newUser = [DBServices mergeEntity:[[[User alloc] init] initProperties:
                                             [[NSMutableArray alloc] initWithObjects:
                                              [NSString stringWithFormat:@"%d", -1],
                                              user.objectID, user.name, [user objectForKey:@"email"], nil]]];
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@(newUser.objectID) forKey:@"user_id"];
    [userDefaults synchronize];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController* navigationController = [storyboard instantiateViewControllerWithIdentifier:@"NavigationController"];
    MainQ *viewController = [[navigationController viewControllers] objectAtIndex:0];
    viewController.user = newUser;
    viewController.logoutView = loginView;
    [self presentViewController:navigationController animated:YES completion:nil];
}

- (IBAction)connectFacebookClicked:(id)sender
{
    for (id obj in self.loginView.subviews)
    {
        if ([obj isKindOfClass:[UIButton class]])
        {
            UIButton* loginButton = obj;
            [loginButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Skip"])
    {
        self.skipView = [segue destinationViewController];
    }
}

- (IBAction)questionClicked:(id)sender
{
    UITapGestureRecognizer *blockTap = [[UITapGestureRecognizer alloc]
                                        initWithTarget:self action:@selector(tapped:)];
    blockTap.delegate = self;
    self.modalView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.modalView.opaque = NO;
    self.modalView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7f];
    self.skipContainer.hidden = NO;
    [self.modalView addSubview:self.skipContainer];
    self.skipContainer.hidden = NO;
    [self.modalView addGestureRecognizer:blockTap];
    //self.skipContainer.layer.cornerRadius = 25;
    //self.skipContainer.layer.masksToBounds = YES;
    [self.view addSubview:self.modalView];
    self.skipContainer.hidden = NO;
    self.skipView.viewController = self;
}

- (IBAction)tapped:(id)sender
{
    if (!self.skipContainer.hidden)
    {
        [self skipViewExitClicked];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (touch.view.tag == 1)
        return NO;
    return YES;
}

-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
}

-(void)continueClicked:(id)sender
{
    [self skipViewExitClicked];
    [self performSegueWithIdentifier:@"PhoneNumber" sender:sender];
}

-(void)skipViewExitClicked
{
    [self.modalView removeFromSuperview];
    self.skipContainer.hidden = YES;
}

@end
