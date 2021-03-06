//
//  Comment.h
//  Q
//
//  Created by Noga badhav on 25/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractEntity.h"

@interface Comment : NSObject <AbstractEntity>

@property (nonatomic, assign) NSUInteger queueID;
@property (nonatomic, assign) NSUInteger userID;
@property (nonatomic, retain) NSString* descr;

@end
