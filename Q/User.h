//
//  User.h
//  Q
//
//  Created by Noga badhav on 21/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractEntity.h"

@interface User : NSObject <AbstractEntity>

@property (nonatomic, strong) NSString* facebookID;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* email;

@end
