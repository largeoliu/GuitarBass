//
//  GBSeriesTableViewControllerDelegate.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-15.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GBSeriesTableViewControllerDelegate <NSObject>
- (void)loadSeries:(GBSeriesModel*)seriesModel;
@end
