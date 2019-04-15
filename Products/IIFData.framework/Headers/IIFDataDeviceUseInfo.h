//
//  IIFDataDeviceUseInfo.h
//  IIFData
//
//  Created by 汉森 on 2019/3/22.
//  Copyright © 2019 VincentWu. All rights reserved.
//

#import <Foundation/Foundation.h>
// 地理位置信息
#import <CoreLocation/CoreLocation.h>
// 运营商
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

NS_ASSUME_NONNULL_BEGIN

@interface IIFDataDeviceUseInfo : NSObject

+ (instancetype)sharedDeviceUseInfo;

/** 获取电池信息 */
+(NSDictionary *)getCurrentBatteryInfo;

/** 获取SIM卡信息 */
+(NSDictionary *)getSimInfo;

/** 获取通讯录信息 */
+(NSArray<NSDictionary *> *)getContacts;

/** GPS定位信息获取接口 */
+(NSDictionary *)getLocationInfo;

///** GPS定位信息获取接口 */
//- (void)getLocationInfo;

///** 获取健康数据信息 */
//+(NSDictionary *)getHealthyInfo;

/** 获取日历数据接口 */
+(NSArray *)getCalendarInfo;

//- (NSString *)getAuthStatus:(NSArray *)

@end

NS_ASSUME_NONNULL_END
