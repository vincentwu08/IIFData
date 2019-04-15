//
//  IIFDataResultViewController.m
//  IIFDataDemo
//
//  Created by 汉森 on 2019/3/27.
//  Copyright © 2019 VincentWu. All rights reserved.
//

#import "IIFDataResultViewController.h"
#import <Masonry.h>
#import "NSString+IIFData.h"

#define TGStatusHeight                  [[UIApplication sharedApplication] statusBarFrame].size.height

@interface IIFDataResultViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSDictionary *resultDict;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation IIFDataResultViewController

- (instancetype)initWithResult:(NSDictionary *)resultDict {
    if (self = [super init]) {
        self.resultDict = resultDict;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"数据采集结果";
    
    self.view.backgroundColor = [UIColor grayColor];
    
    NSLog(@"-----------%f", TGStatusHeight);
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(TGStatusHeight + 44);
        make.left.width.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

//- (void)statusBarFrameWillChange:(NSNotification *)note {
//    [super statusBarFrameWillChange:note];
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.resultDict.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
        {
            NSDictionary *baseInfoDict = self.resultDict[@"baseInfo"];
            return baseInfoDict.count;
            break;
        }
        case 1:
        {
            NSDictionary *locationDict = self.resultDict[@"location"];
            return locationDict.count;
            break;
        }
        case 2:
        {
            NSDictionary *contactsDict = self.resultDict[@"contacts"];
            return contactsDict.count;
            break;
        }
        case 3:
        {
            NSDictionary *calendarDict = self.resultDict[@"calendar"];
            return calendarDict.count;
            break;
        }
        case 4:
        {
            NSDictionary *healthyDict = self.resultDict[@"healthy"];
            return healthyDict.count;
            break;
        }
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *IIFDataResultCell = @"IIFDataResultCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IIFDataResultCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:
                UITableViewCellStyleValue2 reuseIdentifier:IIFDataResultCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    switch (indexPath.section) {
        case 0:
        {
            NSDictionary *baseInfoDict = self.resultDict[@"baseInfo"];
            switch (indexPath.row) {
                case 0:
                {
                    cell.textLabel.text = @"设备指纹";
                    cell.detailTextLabel.text = baseInfoDict[@"deviceUniCode"];
                    break;
                }
                case 1:
                {
                    cell.textLabel.text = @"手机型号";
                    cell.detailTextLabel.text = baseInfoDict[@"phoneModel"];
                    break;
                }
                case 2:
                {
                    cell.textLabel.text = @"手机系统版本";
                    cell.detailTextLabel.text = baseInfoDict[@"phoneSystemVersion"];
                    break;
                }
                case 3:
                {
                    cell.textLabel.text = @"手机可用存储";
                    cell.detailTextLabel.text = baseInfoDict[@"availableStorageSize"];
                    break;
                }
                case 4:
                {
                    cell.textLabel.text = @"手机总存储";
                    cell.detailTextLabel.text = baseInfoDict[@"totalStorageSize"];
                    break;
                }
                case 5:
                {
                    cell.textLabel.text = @"是否为模拟器";
                    cell.detailTextLabel.text = [baseInfoDict[@"isSimulator"] boolValue] ? @"是" : @"否";
                    break;
                }
                default:
                    break;
            }
//            return @"设备基本信息";
            break;
        }
        case 1:
        {
            NSDictionary *locationDict = self.resultDict[@"location"];
            if (0 == indexPath.row) {
                cell.textLabel.text = @"纬度";
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", locationDict[@"latitude"]];
            }else {
                cell.textLabel.text = @"经度";
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", locationDict[@"longitude"]];
            }
            break;
        }
        case 2:
        {
            NSArray *contactsArr = self.resultDict[@"contacts"];
            NSDictionary *contactsDict = contactsArr[indexPath.row];
            cell.textLabel.text = contactsDict[@"contactName"];
            NSString *phoneNumStr = @"";
            for (NSString *phoneNum in contactsDict[@"contactPhoneNum"]) {
                if ([NSString isNotEmpty:phoneNumStr]) {
                    phoneNumStr = [phoneNumStr stringByAppendingString:[NSString stringWithFormat:@",%@", phoneNum]];
                }else {
                    phoneNumStr = [phoneNumStr stringByAppendingString:phoneNum];
                }
            }
            cell.detailTextLabel.text = phoneNumStr;
            break;
        }
        case 3:
        {
            NSArray *calendarArr = self.resultDict[@"calendar"];
            NSDictionary *calendarDict = calendarArr[indexPath.row];
            cell.textLabel.text = calendarDict[@"title"];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@-%@", calendarDict[@"startDate"], calendarDict[@"endDate"]];
            break;
        }
        case 4:
        {
            NSArray *healthyArr = self.resultDict[@"healthy"];
            NSDictionary *healthyDict = healthyArr[indexPath.row];
            cell.textLabel.text = healthyDict[@"date"];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@步----%@KM", healthyDict[@"totleSteps"], healthyDict[@"totleDistance"]];
            break;
        }
        default:
            break;
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
        {
//            NSDictionary *baseInfoDict = self.resultDict[@"baseInfo"];
            return @"设备基本信息";
            break;
        }
        case 1:
        {
//            NSDictionary *calendarDict = self.resultDict[@"calendar"];
            return @"定位数据";
            break;
        }
        case 2:
        {
//            NSDictionary *contactsDict = self.resultDict[@"contacts"];
            return @"通讯录";
            break;
        }
        case 3:
        {
//            NSDictionary *locationDict = self.resultDict[@"location"];
            return @"日历数据";
            break;
        }
        case 4:
        {
//            NSDictionary *healthyDict = self.resultDict[@"healthy"];
            return @"健康数据";
            break;
        }
        default:
            break;
    }
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.00001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.f;
}

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        tableView.backgroundColor = TGMainBackgroudColor;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

@end
