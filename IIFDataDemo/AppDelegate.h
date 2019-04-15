//
//  AppDelegate.h
//  IIFDataDemo
//
//  Created by 汉森 on 2019/4/1.
//  Copyright © 2019 VincentWu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

