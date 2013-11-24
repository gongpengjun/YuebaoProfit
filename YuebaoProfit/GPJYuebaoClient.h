//
//  GPJYuebaoClient.h
//  YuebaoProfit
//
//  Created by Gong Pengjun on 13-11-24.
//  Copyright (c) 2013年 www.GongPengjun.com. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface GPJYuebaoClient : AFHTTPSessionManager
+ (instancetype)sharedClient;
- (void)fetchNetValueOfDate:(NSDate*)date success:(void (^)(double netValue))success failed:(void (^)(NSError *error))failed;
@end
