//
//  GBSeriesTableViewController.m
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-13.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBSeriesTableViewController.h"
#import "GBAppDelegate.h"
#import "GBSeriesList.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

@interface GBSeriesTableViewController ()

@end

@implementation GBSeriesTableViewController
@synthesize delegate = _delegate;
- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.view.backgroundColor = [UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:1.0];
    }
    return self;
}


- (void)loadData
{
    _listRequest = [[GBGetSeriesListRequest alloc] init];
    _listRequest.delegate = self;
    [_listRequest start];
}

- (void)onReceiveSeriesListSucceed:(GBSeriesList*)seriesList
{
    _seriesList = nil;
    _seriesList = seriesList;
    
    GBSeriesModel *seriesModel = [_seriesList infoAtIndex:0];
    if (_delegate) {
        [_delegate onLoadSeries:seriesModel];
    }
    
    NSString* docsdir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* dbpath = [docsdir stringByAppendingPathComponent:@"cache.sqlite"];
    FMDatabase* db = [FMDatabase databaseWithPath:dbpath];
    [db open];
    [db setShouldCacheStatements:YES];
    
    if(![db tableExists:@"lastSeries"]){
        [db executeUpdate:@"CREATE TABLES lastSeries(seriesId TEXT, title TEXT)"];
    }
    
    FMResultSet *rs = [db executeQuery:@"select * from series"];
    while ([rs next]) {
        NSLog(@"%@ %@",
              [rs stringForColumn:@"firstname"],
              [rs stringForColumn:@"lastname"]);
    }
    
    [db close];
}

- (void)loadView
{
    [super loadView];
    
    CGRect tableFrame = self.view.bounds;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        tableFrame.origin.y = 20;
        tableFrame.size.height -= 20;
    }
    tableFrame.size.width = 200;
    
    
    _tableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    _tableView.backgroundColor = [UIColor clearColor];
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        _tableView.separatorInset = UIEdgeInsetsMake(0, -20, 0, 0);
    }
    _tableView.separatorColor = [UIColor blackColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!_seriesList) {
        return 0;
    }
    return _seriesList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SeriesCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:18];
        
        cell.selectedBackgroundView = [[UIView alloc] init];
        cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    }
    GBSeriesModel *seriesModel = [_seriesList infoAtIndex:indexPath.row];
    cell.textLabel.text = seriesModel.title;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GBSeriesModel *seriesModel = [_seriesList infoAtIndex:indexPath.row];
    if (_delegate) {
        [_delegate onLoadSeries:seriesModel];
    }
    [[GBAppDelegate defaultAppDelegate] showRootController];
}

@end
