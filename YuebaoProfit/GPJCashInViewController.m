//
//  GPJCashInViewController.m
//  YuebaoProfit
//
//  Created by Gong Pengjun on 13-11-24.
//  Copyright (c) 2013年 www.GongPengjun.com. All rights reserved.
//

#import "GPJCashInViewController.h"

@interface GPJCashInViewController ()
@property (weak, nonatomic) IBOutlet UILabel *capitalLabel;
- (void)configureView;
@end

@implementation GPJCashInViewController

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
    self.title = [NSString stringWithFormat:@"%@ 转入",[self.detailDate dateString]];
    self.capitalLabel.text = [NSString stringWithFormat:@"%.2f元",[(GPJCashInDate*)self.detailDate capital]];
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
