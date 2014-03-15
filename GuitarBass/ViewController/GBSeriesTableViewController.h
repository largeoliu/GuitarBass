//
//  GBSeriesTableViewController.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-13.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBSeriesList.h"
#import "GBSeriesTableViewControllerDelegate.h"

@interface GBSeriesTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_tableView;
    __strong GBSeriesList *_seriesList;
}
@property (weak) id<GBSeriesTableViewControllerDelegate> delegate;
@end
