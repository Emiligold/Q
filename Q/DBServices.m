//
//  DBServices.m
//  Q
//
//  Created by Noga badhav on 22/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import "DBServices.h"
#import "DBManager.h"

@implementation DBServices

+(id<AbstractEntity>)getEntityById:(id<AbstractEntity>)entityClass entityClass:(NSUInteger)objectID
{
    NSMutableArray *parameters = [[NSMutableArray alloc] initWithObjects:
                                  [NSString stringWithFormat:@"id = %ld", (unsigned long)objectID], nil];
    return [self uniqueSelect:entityClass entityClass:parameters];
}

+(id<AbstractEntity>)getEntityByUniqe:(id<AbstractEntity>)entityClass entityClass:(NSMutableArray*)parameters
{
    return  [self uniqueSelect:entityClass entityClass:parameters];
}

+(id<AbstractEntity>)uniqueSelect:(id<AbstractEntity>)entityClass entityClass:(NSMutableArray*)parameters
{
    return [DBServices select:entityClass entityClass:parameters][0];
}

+(NSMutableArray*)select:(id<AbstractEntity>)entityClass entityClass:(NSMutableArray*)parameters
{
    [[DBManager shared] selectQuery:[entityClass tableName] table:parameters];
    NSMutableArray *values = [[NSMutableArray alloc] initWithArray:[[DBManager shared] executeNonExecutableQuery]];
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (NSMutableArray *curr in values)
    {
        [result addObject:[[entityClass initialize] initProperties:curr]];
    }
    
    return result;
}

+(id<AbstractEntity>)mergeEntity:(id<AbstractEntity>)entity
{
    [[DBManager shared] mergeQuery:[entity tableName] table:entity.properties];
    [[DBManager shared] executeExecutableQuery];
    entity.objectID = entity.objectID == -1 ? (NSUInteger)[[DBManager shared] lastInsertedRowID] : entity.objectID;
    
    return entity;
}

+(id<FBGraphUser>)currFacebookUser:(id<FBGraphUser>)recieved
{
    static id<FBGraphUser> user = nil;
    
    if (user == nil || recieved != nil)
    {
        user = recieved;
    }
    
    return user;
}

+(id<FBGraphUser>)getCurrFacebookUser
{
    return [DBServices currFacebookUser:nil];
}

+(void)setCurrFacebookUser:(id<FBGraphUser>)user
{
    [DBServices currFacebookUser:user];
}

@end
