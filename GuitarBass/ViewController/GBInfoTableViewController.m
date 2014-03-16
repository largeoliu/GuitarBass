//
//  GBInfoTableViewController.m
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-13.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBInfoTableViewController.h"
#import "GBInfoTableViewCell.h"
#import "GBInfoDetailViewController.h"

@interface GBInfoTableViewController ()

@end

@implementation GBInfoTableViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:29.0/255.0 green:29.0/255.0 blue:29.0/255.0 alpha:1.0]];
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
        
        NSShadow *shadow = [[NSShadow alloc] init];
        shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
        shadow.shadowOffset = CGSizeMake(0, 1);
        [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                               shadow, NSShadowAttributeName,
                                                               [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
        
    }
    return self;
}

- (void)loadData
{
    GBInfoList *infoList = [[GBInfoList alloc] init];
    
    GBInfoModel *info1 = [[GBInfoModel alloc] init];
    info1.title = @"【Livehouse终极攻略】武汉 VOX Livehouse";
    info1.thumbUrl = @"http://musicianguide.cn/wp-content/uploads/2014/01/MG_2955.jpg";
    info1.webUlr = @"http://guitarbass.sinaapp.com/app/article?aid=1";
    [infoList addInfo:info1];
    
    GBInfoModel *info2 = [[GBInfoModel alloc] init];
    info2.title = @"音乐人的另一个舞台：名片音乐人的另一个舞台：名片音乐人的另一个舞台：名片音乐人的另一个舞台：名片";
    info2.thumbUrl = @"http://musicianguide.cn/wp-content/uploads/2014/01/bart-business-card1.jpg";
    info2.webUlr = @"http://guitarbass.sinaapp.com/app/article?aid=2";
    [infoList addInfo:info2];
    
    [self onReceiveInfoListSucceed:infoList];
}

- (void)onReceiveInfoListSucceed:(GBInfoList*)infoList
{
    _infoList = nil;
    _infoList = infoList;
    [self.tableView reloadData];
}

- (void)onLoadSeries:(GBSeriesModel*)seriesModel
{
    self.title = seriesModel.title;
    
    int seriesId = seriesModel.uniqueId;
    
    [self loadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorInset = UIEdgeInsetsMake(0, -20, 0, 0);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!_infoList) {
        return 0;
    }
    return _infoList.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [GBInfoTableViewCell height];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"InfoCell";
    GBInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[GBInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    GBInfoModel *infoModel = [_infoList infoAtIndex:indexPath.row];
    [cell loadWithInfo:infoModel];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GBInfoModel *infoModel = [_infoList infoAtIndex:indexPath.row];
    GBInfoDetailViewController *odvc = [[GBInfoDetailViewController alloc] init];
    [odvc loadWithInfo:infoModel];
    [self.navigationController pushViewController:odvc animated:YES];
}

@end
