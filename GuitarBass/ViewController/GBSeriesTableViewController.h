//
//  GBSeriesTableViewController.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-13.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBSeriesTableViewControllerDelegate.h"
#import "GBSeriesListRequestDelegate.h"
@class GBSeriesList;
@protocol GBSeriesListRequestDelegate;
@interface GBSeriesTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, GBSeriesListRequestDelegate>
{
    UITableView *_tableView;
    __strong GBSeriesList *_seriesList;
}
@property (weak) id<GBSeriesTableViewControllerDelegate> delegate;
@end
