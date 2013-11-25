//
//  GPJMasterViewController.m
//  YuebaoProfit
//
//  Created by Gong Pengjun on 13-11-24.
//  Copyright (c) 2013年 www.GongPengjun.com. All rights reserved.
//

#import "GPJMasterViewController.h"
#import "GPJYuebaoClient.h"
#import "GPJModel.h"
#import "GPJProfitViewController.h"
#import "GPJCashInViewController.h"

@interface GPJMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation GPJMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initializeData];
    [self.tableView reloadData];
    
    NSDate* yesterDay = [NSDate dateWithTimeIntervalSinceNow:-24*60*60];
    [[GPJYuebaoClient sharedClient] fetchNetValueOfDate:yesterDay success:^(double netValue) {
        NSLog(@"%s,%d net value: %f",__FUNCTION__,__LINE__,netValue);
    } failed:^(NSError *error) {
        NSLog(@"%s,%d failed: %@",__FUNCTION__,__LINE__,error);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Model

- (void)initializeData
{
    _objects = [[NSMutableArray alloc] init];
    
    GPJCashInDate* cashIn = nil;
    cashIn = [[GPJCashInDate alloc] initWithDateString:@"2013-11-17"];
    cashIn.capital = 192.0f;
    [_objects addObject:cashIn];

    double totalCapital = cashIn.capital;
    
    cashIn = [[GPJCashInDate alloc] initWithDateString:@"2013-11-18"];
    cashIn.capital = 15000.0f;
    [_objects addObject:cashIn];
    
    totalCapital += cashIn.capital;
    
    GPJProfitDate* profitDate = nil;
    
    profitDate = [[GPJProfitDate alloc] initWithDateString:@"2013-11-20"];
    profitDate.capital = totalCapital;
    profitDate.netRate = 1.3377f;
    profitDate.profit = 0.0f;
    [_objects addObject:profitDate];
    
    profitDate = [[GPJProfitDate alloc] initWithDateString:@"2013-11-21"];
    profitDate.capital = totalCapital;
    profitDate.netRate = 1.3352f;
    profitDate.profit = 0.0f;
    [_objects addObject:profitDate];
    
    profitDate = [[GPJProfitDate alloc] initWithDateString:@"2013-11-22"];
    profitDate.capital = totalCapital;
    profitDate.netRate = 1.3442f;
    profitDate.profit = 0.0f;
    [_objects addObject:profitDate];
    
    profitDate = [[GPJProfitDate alloc] initWithDateString:@"2013-11-23"];
    profitDate.capital = totalCapital;
    profitDate.netRate = 1.3502f;
    profitDate.profit = 0.0f;
    [_objects addObject:profitDate];
    
    profitDate = [[GPJProfitDate alloc] initWithDateString:@"2013-11-24"];
    profitDate.capital = totalCapital;
    profitDate.netRate = 1.3469f;
    profitDate.profit = 0.0f;
    [_objects addObject:profitDate];
    
    [_objects sortWithOptions:NSSortConcurrent usingComparator:^NSComparisonResult(id obj1, id obj2) {
        GPJDate* date1 = obj1;
        GPJDate* date2 = obj2;
        return [date2.date compare:date1.date];
    }];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = _objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GPJDate *object = _objects[indexPath.row];
    
    if([object isKindOfClass:[GPJCashInDate class]])
        [self performSegueWithIdentifier:@"CashInDetail" sender:nil];
    else if([object isKindOfClass:[GPJProfitDate class]])
        [self performSegueWithIdentifier:@"ProfitDetail" sender:nil];
    else
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    GPJDate *object = _objects[indexPath.row];
    [(id)[segue destinationViewController] setDetailDate:object];
}

@end
