//
//  ViewController.m
//  IIFDataDemo
//
//  Created by 汉森 on 2019/3/22.
//  Copyright © 2019 VincentWu. All rights reserved.
//

#import "ViewController.h"
#import <IIFData/IIFData.h>
#import <IIFData/IIFDataDeviceUseInfo.h>
#import <IIFData/IIFDataDeviceBaseInfo.h>
#import <Masonry.h>
#import <SVProgressHUD.h>
#import "IIFDataResultViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"IIFDataDemo";
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectZero];
    [btn setTitle:@"立即申请" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor colorWithRed:.3 green:.3 blue:.3 alpha:1];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.width.mas_equalTo(280);
        make.height.mas_equalTo(44);
    }];
}

- (void)btnDidClicked:(id)sender {
    [SVProgressHUD show];
    
    [IIFData tackEvent:@"立即申请" mustCollectAuthItem:@[@(AuthItemLocation), @(AuthItemContacts), @(AuthItemHealthy), @(AuthItemCalendar)] withProperties:nil completeBlock:^(NSDictionary *resultDict) {
        NSLog(@"%@", resultDict);
        [SVProgressHUD dismiss];
        IIFDataResultViewController *resultVc = [[IIFDataResultViewController alloc] initWithResult:resultDict];
        [self.navigationController pushViewController:resultVc animated:YES];
    } errorBlock:^(NSError *error) {
        [SVProgressHUD showInfoWithStatus:error.userInfo[NSLocalizedDescriptionKey]];
    }];
}

@end
