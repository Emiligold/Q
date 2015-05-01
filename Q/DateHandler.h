//
//  DateHandler.h
//  Q
//
//  Created by Noga badhav on 25/04/15.
//  Copyright (c) 2015 Noga badhav. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateHandler : NSObject

+(NSString*)stringFromDate:(NSDate*)date;

+(NSDate*)dateFromString:(NSString*)date;

+(NSString*)dayStringOfWeek:(NSDate*)date;

+(NSString*)hourOfDay:(NSDate*)date;

+(NSString*)getDateMessageString:(NSDate*)date;

@end
