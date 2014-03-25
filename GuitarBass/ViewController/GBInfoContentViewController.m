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
    CGRect tableFrame = self.view.bounds;
    tableFrame.size.height = 200;
    _scrollView = [[UIScrollView alloc] initWithFrame:tableFrame];
    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*_infoList.count, self.view.bounds.size.height);
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.backgroundColor = [UIColor greenColor];
    _scrollView.showsHorizontalScrollIndicator = YES;
    [self.view addSubview:_scrollView];
    
    GBInfoDetailView *idv = [[GBInfoDetailView alloc] initWithFrame:CGRectOffset(_scrollView.bounds, _scrollView.bounds.size.width*_currentIndex, 0)];
    idv.tag = 100+_currentIndex;
    [_scrollView addSubview:idv];
    [_scrollView setContentOffset:CGPointMake(self.view.bounds.size.width*_currentIndex, 0) animated:NO];
    NSLog(@"%f", idv.frame.origin.x);
    [self pageChanged];
}

- (void)pageChanged
{
    self.title = [_infoList infoAtIndex:_currentIndex].title;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger lastIndex = _currentIndex;
    _currentIndex = scrollView.contentOffset.x/_scrollView.bounds.size.width;
    if (lastIndex != _currentIndex) {
        [[_scrollView viewWithTag:100+lastIndex] removeFromSuperview];
        GBInfoDetailView *idv = [[GBInfoDetailView alloc] initWithFrame:CGRectOffset(self.view.bounds, _scrollView.bounds.size.width*_currentIndex, 0)];
        idv.tag = 100+_currentIndex;
        [_scrollView addSubview:idv];
        [self pageChanged];
    }
}

@end
