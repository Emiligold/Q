//
//  FacebookManager.h
//  Q
//
//  Created by Noga badhav on 22/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>
#import "MainQ.h"

@interface FacebookManager : NSObject <FBLoginViewDelegate>

@property (nonatomic, strong) FBLoginView* logoutView;
+(instancetype)instance:(MainQ*)mainQ;
-(void)connect;

@end
