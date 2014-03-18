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
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"GuitarBass";
        
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    CGRect tableFrame = self.view.bounds;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        tableFrame.size.height -= self.navigationController.navigationBar.bounds.size.height+20;
    }else{
        tableFrame.size.height -= self.navigationController.navigationBar.bounds.size.height;
    }
    
    _tableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    _tableView.backgroundColor = [UIColor whiteColor];
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        _tableView.separatorInset = UIEdgeInsetsMake(0, -20, 0, 0);
    }
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = YES;
}

- (void)loadData
{
    
    GBInfoList *infoList = [[GBInfoList alloc] init];
    
    GBInfoModel *info1 = [[GBInfoModel alloc] init];
    info1.title = @"【Livehouse终极攻略】武汉 VOX Livehouse";
    info1.thumbUrl = @"http://musicianguide.cn/wp-content/uploads/2014/01/MG_2955.jpg";
    info1.webUlr = @"http://guitarbass.sinaapp.com/app/article?aid=2";
    [infoList addInfo:info1];
    
    GBInfoModel *info2 = [[GBInfoModel alloc] init];
    info2.title = @"音乐人的另一个舞台：名片音乐人的另一个舞台：名片音乐人的另一个舞台：名片音乐人的另一个舞台：名片";
    info2.thumbUrl = @"http://musicianguide.cn/wp-content/uploads/2014/01/bart-business-card1.jpg";
    info2.webUlr = @"http://tinman.cn";
    [infoList addInfo:info2];
    [infoList addInfo:info2];
    [infoList addInfo:info2];
    [infoList addInfo:info2];
    [infoList addInfo:info2];
    [infoList addInfo:info2];
    
    [self onReceiveInfoListSucceed:infoList];
}

- (void)onReceiveInfoListSucceed:(GBInfoList*)infoList
{
    _infoList = nil;
    _infoList = infoList;
    [_tableView reloadData];
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
    [self.navigationController.navigationBar setTranslucent:NO];
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBarTintColor:)]) {
        [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:29.0/255.0 green:29.0/255.0 blue:29.0/255.0 alpha:1.0]];
        [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    }else{
        [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:29.0/255.0 green:29.0/255.0 blue:29.0/255.0 alpha:1.0]];
    }
    
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    
    [self.navigationController.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                                      [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                                      shadow, NSShadowAttributeName,
                                                                      [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
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
