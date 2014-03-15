//
//  GBAppDelegate.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-13.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDMenuController.h"

@interface GBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) DDMenuController *menuController;
@property (strong, nonatomic) UIWindow *window;
+ (GBAppDelegate *)defaultAppDelegate;
@end
