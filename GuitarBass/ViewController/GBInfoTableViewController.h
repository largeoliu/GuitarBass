//
//  GBInfoTableViewController.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-13.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBSeriesModel.h"
#import "GBInfoList.h"
#import "GBSeriesTableViewControllerDelegate.h"
#import "GBInfoListRequestDelegate.h"

@interface GBInfoTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, GBSeriesTableViewControllerDelegate,GBInfoListRequestDelegate>
{
    UITableView *_tableView;
    __strong GBInfoList *_infoList;
}
@end
