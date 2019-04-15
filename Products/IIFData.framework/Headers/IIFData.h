//
//  IIFData.h
//  IIFData
//
//  Created by 汉森 on 2019/3/22.
//  Copyright © 2019 VincentWu. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for IIFData.
FOUNDATION_EXPORT double IIFDataVersionNumber;

//! Project version string for IIFData.
FOUNDATION_EXPORT const unsigned char IIFDataVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <IIFData/PublicHeader.h>
#import <IIFData/IIFDataDeviceBaseInfo.h>
#import <IIFData/IIFDataDeviceUseInfo.h>

typedef NS_ENUM(NSUInteger, AuthItem){
    AuthItemLocation = 1,
    AuthItemContacts,
    AuthItemHealthy,
    AuthItemCalendar,
    AuthItemAll
};

//SDK Delegate 回调接口
@protocol IIFDataSdkDelegate;


@interface IIFData : NSObject

typedef void(^CallBackBlock)(NSDictionary *resultDict);
typedef void(^ErrorBlock)(NSError *error);
#pragma mark- init instance

/**
 *  启动IIFData SDK
 *
 *  @param appId     设置app的IIFData appId，此appId从业务系统获取
 *  @param appKey    设置app的IIFData appKey，此appKey从业务系统获取
 *  @param authItems 设置app plist中配置的权限，数组元素从AuthItem中取
 *  @param delegate  回调代理delegate
 */
+ (void)startSdkWithAppId:(NSString *)appId appKey:(NSString *)appKey authItems:(NSArray *)authItems delegate:(id<IIFDataSdkDelegate>)delegate;


/**
 *  采集事件触发
 *
 *  @param tackEvent    设置采集事件名称，整点采集设置“sharp”
 *  @param properties   设置采集参数，例："mustCollectItem"
 */
+ (void)tackEvent:(NSString *)tackEvent mustCollectAuthItem:(NSArray *)mustCollectAuthItem withProperties:(NSMutableDictionary *)properties completeBlock:(CallBackBlock)completeBlock errorBlock:(ErrorBlock)errorBlock;

@end

#pragma mark - SDK Delegate
@protocol IIFDataSdkDelegate <NSObject>

@optional

@end

