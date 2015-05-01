//
//  User.m
//  Q
//
//  Created by Noga badhav on 21/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize objectID;

-(NSString*)tableName
{
    return tUsers;
}

-(id)initProperties:(NSMutableArray*)properties
{
    self.objectID = [properties[0] integerValue];
    self.facebookID = properties[1];
    self.name = properties[2];
    self.email = properties[3];
    return self;
}

-(id<AbstractEntity>)initialize
{
    return [[User alloc] init];
}

-(NSMutableArray*)properties
{
    return [[NSMutableArray alloc] initWithObjects:
            (self.objectID == -1 ? @"null" : [NSString stringWithFormat:@"%d", self.objectID]),
            [NSString stringWithFormat:@"'%@'", self.facebookID],
            [NSString stringWithFormat:@"'%@'", self.name],
            [NSString stringWithFormat:@"'%@'", self.email],
            nil];
}

@end
