//
//  GPJProfitDate.m
//  YuebaoProfit
//
//  Created by Gong Pengjun on 13-11-24.
//  Copyright (c) 2013年 www.GongPengjun.com. All rights reserved.
//

#import "GPJProfitDate.h"

@implementation GPJProfitDate

- (double)profit
{
    if(_profit == 0.0f)
    {  // 当日收益 =（余额宝确认资金/10000 ）X 每万份收益
        _profit = _capital / 10000.0f * _netRate;
    }
    return _profit;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %.4f元 / %.2f元",[self dateString],self.netRate,self.profit];
    //return [NSString stringWithFormat:@"收益 %@ 万份收益:%.2f元 总收益:%f元",[super description],self.netRate,self.profit];
}

@end
