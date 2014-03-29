//
//  GBSeriesTableViewController.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-13.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBSeriesTableViewControllerDelegate.h"
#import "GBSeriesListRequestDelegate.h"
#import "GBGetSeriesListRequest.h"
@class GBSeriesList;
@protocol GBSeriesListRequestDelegate;
@interface GBSeriesTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, GBSeriesListRequestDelegate>
{
    UITableView *_tableView;
    GBSeriesList *_seriesList;
    GBGetSeriesListRequest *_listRequest;
}
@property (weak) id<GBSeriesTableViewControllerDelegate> delegate;
@end
