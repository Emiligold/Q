//
//  Comment.m
//  Q
//
//  Created by Noga badhav on 25/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import "Comment.h"

@implementation Comment

@synthesize objectID;

-(NSString*)tableName
{
    return tComment;
}

-(id)initProperties:(NSMutableArray*)properties
{
    self.objectID = [properties[0] integerValue];
    self.queueID = [properties[1] integerValue];
    self.userID = [properties[2] integerValue];
    self.descr = properties[3];
    
    return self;
}

-(id<AbstractEntity>)initialize
{
    return [[Comment alloc] init];
}

-(NSMutableArray*)properties
{
    return [[NSMutableArray alloc] initWithObjects:
            (self.objectID == -1 ? @"null" : [NSString stringWithFormat:@"%d", self.objectID]),
            [NSString stringWithFormat:@"%d", self.queueID],
            [NSString stringWithFormat:@"%d", self.userID],
            [NSString stringWithFormat:@"'%@'", self.descr],
            nil];
}

@end
