//
//  GBAppDelegate.m
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-13.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBAppDelegate.h"
#import "GBInfoTableViewController.h"
#import "GBSeriesTableViewController.h"
#import "DDMenuController.h"
#import "FMDatabase.h"

@implementation GBAppDelegate

@synthesize window = _window;
@synthesize menuController = _menuController;

static id currentAppDelegate = nil;

+ (GBAppDelegate *)defaultAppDelegate
{
    return currentAppDelegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    currentAppDelegate = self;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    GBInfoTableViewController *mainController = [[GBInfoTableViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainController];
    
    DDMenuController *rootController = [[DDMenuController alloc] initWithRootViewController:navController];
    _menuController = rootController;
    
    GBSeriesTableViewController *leftController = [[GBSeriesTableViewController alloc] initWithDelegate:mainController];
    rootController.leftViewController = leftController;

    
    self.window.rootViewController = rootController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;

    return YES;
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent
{
    [_menuController presentViewController:viewControllerToPresent animated:YES completion:nil];
}

- (void)showRootController
{
    [_menuController showRootController:YES];
}

+ (FMDatabase*)shareCacheDB
{
    NSString* docsdir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* dbpath = [docsdir stringByAppendingPathComponent:@"cache.sqlite"];
    return [FMDatabase databaseWithPath:dbpath];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
