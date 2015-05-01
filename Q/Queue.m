//
//  Queue.m
//  Q
//
//  Created by Noga badhav on 25/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import "Queue.h"
#import "DateHandler.h"

@implementation Queue

@synthesize objectID;

-(NSString*)tableName
{
    return tQueues;
}

-(id)initProperties:(NSMutableArray*)properties
{
    self.objectID = [properties[0] integerValue];
    self.userID = [properties[1] integerValue];
    self.country = properties[2];
    self.location = properties[3];
    self.descr = properties[4];
    self.startTime = [DateHandler dateFromString: properties[5]];
    self.endTime = [DateHandler dateFromString: properties[6]];
    self.isCurrent = [properties[7] boolValue];
    
    return self;
}

-(id<AbstractEntity>)initialize
{
    return [[Queue alloc] init];
}

-(NSMutableArray*)properties
{
    return [[NSMutableArray alloc] initWithObjects:
            (self.objectID == -1 ? @"null" : [NSString stringWithFormat:@"%d", self.objectID]),
            [NSString stringWithFormat:@"%d", self.userID],
            [NSString stringWithFormat:@"'%@'", self.country],
            [NSString stringWithFormat:@"'%@'", self.location],
            [NSString stringWithFormat:@"'%@'", self.descr],
            [NSString stringWithFormat:@"'%@'", self.startTime],
            [NSString stringWithFormat:@"'%@'", self.endTime],
            @(self.isCurrent),
            nil];
}

@end
