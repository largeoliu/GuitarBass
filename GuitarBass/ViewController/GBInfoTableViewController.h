//
//  GBInfoTableViewController.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-13.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBSeriesTableViewControllerDelegate.h"
#import "GBInfoListRequestDelegate.h"
#import "GBGetInfoListRequest.h"
@class GBInfoList;
@class GBSeriesModel;
@interface GBInfoTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, GBSeriesTableViewControllerDelegate,GBInfoListRequestDelegate>
{
    UITableView *_tableView;
    GBInfoList *_infoList;
    GBGetInfoListRequest *_listRequest;
    GBSeriesModel *_currentSeries;
}
@end
