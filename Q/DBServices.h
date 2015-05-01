//
//  DBServices.h
//  Q
//
//  Created by Noga badhav on 22/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractEntity.h"
#import <FacebookSDK/FacebookSDK.h>

@interface DBServices : NSObject

+(id<AbstractEntity>)getEntityById:(id<AbstractEntity>)entityClass entityClass:(NSUInteger)objectID;

+(id<AbstractEntity>)getEntityByUniqe:(id<AbstractEntity>)entityClass entityClass:(NSMutableArray*)parameters;

+(id<AbstractEntity>)mergeEntity:(id<AbstractEntity>)entity;

+(id<FBGraphUser>)getCurrFacebookUser;

+(void)setCurrFacebookUser:(id<FBGraphUser>)user;


@end
