//
//  GPJCashInDate.m
//  YuebaoProfit
//
//  Created by Gong Pengjun on 13-11-24.
//  Copyright (c) 2013年 www.GongPengjun.com. All rights reserved.
//

#import "GPJCashInDate.h"

@implementation GPJCashInDate

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ 转入 %.2f元",[self dateString],self.capital];
}

@end
