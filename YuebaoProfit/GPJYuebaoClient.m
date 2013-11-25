//
//  GPJYuebaoClient.m
//  YuebaoProfit
//
//  Created by Gong Pengjun on 13-11-24.
//  Copyright (c) 2013年 www.GongPengjun.com. All rights reserved.
//

#import "GPJYuebaoClient.h"

NSString * const kYuebaoBaseURLString = @"http://www.thfund.com.cn/";

@implementation GPJYuebaoClient

+ (instancetype)sharedClient
{
    static GPJYuebaoClient* s_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_sharedClient = [[GPJYuebaoClient alloc] initWithBaseURL:[NSURL URLWithString:kYuebaoBaseURLString]];
        s_sharedClient.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    return s_sharedClient;
}

- (void)fetchNetValueOfDate:(NSDate*)date success:(void (^)(double netValue))success failed:(void (^)(NSError *error))failed
{
    // 1 - prepare request parameters
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString* dateString = [formatter stringFromDate:date];
    
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    parameters[@"method"] = @"find";
    parameters[@"date"] = dateString;
    parameters[@"fundcode"] = @"000198";
    
    [self POST:@"/calculator.do" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        double netValue = 1.0;
        @try {
            NSData* data = responseObject;
            NSString* netString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSNumberFormatter * numberFormatter = [[NSNumberFormatter alloc] init];
            [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
            NSNumber * netNumber = [numberFormatter numberFromString:netString];
            netValue = [netNumber doubleValue];
            //NSLog(@"%s,%d net number: <%@ %@>",__FUNCTION__,__LINE__,NSStringFromClass([netNumber class]),netNumber);
            success(netValue);
        } @catch(NSException* e) {
            NSLog(@"%s,%d exception %@",__FUNCTION__,__LINE__,e);
            failed(nil);
        } @finally {
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failed(error);
    }];
    
}

@end
