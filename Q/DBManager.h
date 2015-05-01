//
//  DBManager.h
//  Q
//
//  Created by Noga badhav on 21/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBManager : NSObject

+(instancetype)shared;

@property (nonatomic) long long lastInsertedRowID;

-(void)mergeQuery:(NSString*)table table:(NSMutableArray*)values;

-(void)executeExecutableQuery;

-(NSArray *)executeNonExecutableQuery;

-(void)selectQuery:(NSString*)table table:(NSMutableArray*)conditionParameters;

@end
