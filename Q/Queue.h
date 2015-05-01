//
//  Queue.h
//  Q
//
//  Created by Noga badhav on 25/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractEntity.h"

@interface Queue : NSObject <AbstractEntity>

@property (nonatomic, assign) NSUInteger userID;
@property (nonatomic, retain) NSString* country;
@property (nonatomic, retain) NSString* location;
@property (nonatomic, retain) NSString* descr;
@property (nonatomic, retain) NSDate* startTime;
@property (nonatomic, retain) NSDate* endTime;
@property (nonatomic, assign) BOOL isCurrent;

@end
