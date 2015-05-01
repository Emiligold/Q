//
//  LikeQueue.m
//  Q
//
//  Created by Noga badhav on 25/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import "LikeQueue.h"

@implementation LikeQueue

@synthesize objectID;

-(NSString*)tableName
{
    return tLikeQueue;
}

-(id)initProperties:(NSMutableArray*)properties
{
    self.objectID = [properties[0] integerValue];
    self.queueID = [properties[1] integerValue];
    self.userID = [properties[2] integerValue];
    
    return self;
}

-(id<AbstractEntity>)initialize
{
    return [[LikeQueue alloc] init];
}

-(NSMutableArray*)properties
{
    return [[NSMutableArray alloc] initWithObjects:
            (self.objectID == -1 ? @"null" : [NSString stringWithFormat:@"%d", self.objectID]),
            [NSString stringWithFormat:@"%d", self.queueID],
            [NSString stringWithFormat:@"%d", self.userID],
            nil];
}

@end
