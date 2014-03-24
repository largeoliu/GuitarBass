//
//  GBInfoContentViewController.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-24.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

@class GBInfoList;
@interface GBInfoContentViewController : UIViewController
{
    UIScrollView *_scrollView;
    GBInfoList *_infoList;
    NSUInteger _currentIndex;
}
- (void)loadWithInfoList:(GBInfoList*)infoList forIndex:(NSUInteger)index;
@end
