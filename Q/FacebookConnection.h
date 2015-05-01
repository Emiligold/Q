//
//  FacebookConnection.h
//  Q
//
//  Created by Noga badhav on 21/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>

@interface FacebookConnection : NSObject <FBLoginViewDelegate>

@property (strong, nonatomic) IBOutlet FBLoginView *loginView;
+(instancetype)instance:(id)viewController;
-(FBLoginView*)startConnection;

@end
