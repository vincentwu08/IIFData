//
//  IIFDataDeviceBaseInfo.h
//  IIFData
//
//  Created by 汉森 on 2019/3/22.
//  Copyright © 2019 VincentWu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class IIFinMachineBaseInfo;

@interface IIFDataDeviceBaseInfo : NSObject

+ (instancetype)sharedDeviceBaseInfo;

/** 获取设备指纹 */
+(NSString *)getDeviceUniCode;

/** 获取手机型号 */
+(NSString *)getPhoneModel;

/** 获取手机系统版本 */
+(NSString *)getPhoneSystemVersion;

/** 获取设备基本信息 */
+(NSDictionary *)getMachineBaseInfo;

/** 是否是模拟器 */
+(BOOL)isSimulator;

/** 可用存储 */
+(NSString *)getAvailableStorageSize;

/** 总存储 */
+(NSString *)getTotalStorageSize;

@end

NS_ASSUME_NONNULL_END
