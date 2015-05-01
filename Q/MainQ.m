//
//  MainQ.m
//  Q
//
//  Created by Noga badhav on 22/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import "MainQ.h"
#import "FacebookManager.h"

@interface MainQ ()

@property (weak, nonatomic) IBOutlet UIView *inQView;

@end

@implementation MainQ

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.logoutView = [[FBLoginView alloc] init];
    [[FacebookManager instance:self] connect];
    self.profileView.profileID = self.user.facebookID;
    self.name.text = self.user.name;
    //self.name.center = CGPointMake(self.view.frame.size.width / 2, 260);
    self.inQView.clipsToBounds = YES;
    self.inQView.layer.cornerRadius = 50;
    self.inQView.layer.borderColor=[UIColor whiteColor].CGColor;
    self.inQView.layer.borderWidth=4.0f;
    self.profileView.layer.cornerRadius = 47.5;
    self.profileView.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)connectedFacebook:(FBLoginView*)logoutView
{
    self.logoutView = logoutView;
    logoutView.center = CGPointMake(self.view.frame.size.width / 2, 500);
    [self.view addSubview:logoutView];
}

- (IBAction)profileClicked:(id)sender
{
}

@end
