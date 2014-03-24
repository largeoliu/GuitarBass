//
//  GBInfoContentViewController.m
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-24.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBInfoContentViewController.h"
#import "GBInfoList.h"
#import "GBInfoDetailView.h"
@interface GBInfoContentViewController ()

@end

@implementation GBInfoContentViewController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        
    }
    return self;
}

- (void)loadWithInfoList:(GBInfoList*)infoList forIndex:(NSUInteger)index
{
    _infoList = infoList;
    _currentIndex = index;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*_infoList.count, self.view.bounds.size.height);
    [self.view addSubview:_scrollView];
    
    _scrollView.contentOffset = CGPointMake(self.view.bounds.size.width*_currentIndex, 0);
    GBInfoDetailView *idv = [[GBInfoDetailView alloc] initWithFrame:CGRectOffset(_scrollView.bounds, _scrollView.contentOffset.x, 0)];
    [_scrollView addSubview:idv];
    
    
}


@end
