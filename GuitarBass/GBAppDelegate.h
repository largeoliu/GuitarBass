//
//  GBAppDelegate.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-13.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//


@class DDMenuController;
@class FMDatabase;
@interface GBAppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) DDMenuController *menuController;
@property (strong, nonatomic) UIWindow *window;
+ (GBAppDelegate *)defaultAppDelegate;
- (void)presentViewController:(UIViewController *)viewControllerToPresent;
- (void)showRootController;
+ (FMDatabase*)shareCacheDB;
@end
