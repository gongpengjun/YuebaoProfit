//
//  GPJDate.m
//  YuebaoProfit
//
//  Created by Gong Pengjun on 13-11-24.
//  Copyright (c) 2013年 www.GongPengjun.com. All rights reserved.
//

#import "GPJDate.h"

@implementation GPJDate

static NSDateFormatter *s_dateFormatter = nil;

+ (void)initialize
{
    s_dateFormatter = [[NSDateFormatter alloc] init];
    [s_dateFormatter setDateFormat:@"YYYY-MM-DD"];
}

- (instancetype)initWithDateString:(NSString*)dateString
{
    NSDate* date = [s_dateFormatter dateFromString:dateString];
    self = [self initWithDate:date];
    return self;
}

- (instancetype)initWithDate:(NSDate*)date
{
    self = [self init];
    if(self)
    {
        self.date = date;
    }
    return self;
}

- (BOOL)isWeekend
{
    return [[NSCalendar currentCalendar] isDateInWeekend:self.date];
}

- (BOOL)isWeekday
{
    return ![self isWeekend];
}

- (NSString*)dateString
{
    return [s_dateFormatter stringFromDate:self.date];
}

- (NSString *)description
{
    return [self dateString];
}

@end
