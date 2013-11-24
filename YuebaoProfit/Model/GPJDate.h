//
//  GPJDate.h
//  YuebaoProfit
//
//  Created by Gong Pengjun on 13-11-24.
//  Copyright (c) 2013年 www.GongPengjun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPJDate : NSObject
@property (strong, nonatomic) NSDate* date;
- (instancetype)initWithDateString:(NSString*)dateString;
- (instancetype)initWithDate:(NSDate*)date;
- (BOOL)isWeekend;
- (BOOL)isWeekday;
- (NSString*)dateString;
- (NSString *)description;
@end
