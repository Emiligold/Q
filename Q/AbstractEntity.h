//
//  AbstractEntity.h
//  Q
//
//  Created by Noga badhav on 21/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AbstractEntity <NSObject>

@property(nonatomic, assign) NSUInteger objectID;
-(NSString*)tableName;
-(id)initProperties:(NSMutableArray*)properties;
-(id<AbstractEntity>)initialize;
-(NSMutableArray*)properties;

@end