//
//  SkipView.h
//  Q
//
//  Created by Noga badhav on 22/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface SkipView : UIViewController

@property (nonatomic, strong) ViewController* viewController;

- (IBAction)exitClicked:(id)sender;

@end
