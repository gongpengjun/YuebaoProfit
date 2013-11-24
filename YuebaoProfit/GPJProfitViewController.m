//
//  GPJProfitViewController.m
//  YuebaoProfit
//
//  Created by Gong Pengjun on 13-11-24.
//  Copyright (c) 2013年 www.GongPengjun.com. All rights reserved.
//

#import "GPJProfitViewController.h"

@interface GPJProfitViewController ()
@property (weak, nonatomic) IBOutlet UILabel *capitalLabel;
@property (weak, nonatomic) IBOutlet UILabel *netRateLabel;
@property (weak, nonatomic) IBOutlet UILabel *profitLabel;
- (void)configureView;
@end

@implementation GPJProfitViewController

- (void)setDetailDate:(GPJDate *)detailDate
{
    if (_detailDate != detailDate) {
        _detailDate = detailDate;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    self.title = [NSString stringWithFormat:@"%@ 收益",[self.detailDate dateString]];
    
    GPJProfitDate* profitDate = (GPJProfitDate*)self.detailDate;
    self.capitalLabel.text = [NSString stringWithFormat:@"%.2f元",profitDate.capital];
    self.netRateLabel.text = [NSString stringWithFormat:@"%.4f元",profitDate.netRate];
    self.profitLabel.text  = [NSString stringWithFormat:@"%.2f元",profitDate.profit];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
