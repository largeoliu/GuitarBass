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
#define TAG_START 100
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

- (void)loadWithInfoList:(GBInfoList*)infoList forIndex:(NSInteger)index
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
    
    [self pageChanged];
    [_scrollView setContentOffset:CGPointMake(self.view.bounds.size.width*_currentIndex, 0) animated:NO];
}

- (void)pageChanged
{
    for (int i = _currentIndex-1; i <= _currentIndex+1; i++) {
        if (i >= 0 && i < _infoList.count&&![_scrollView viewWithTag:(TAG_START+i)]) {
            GBInfoDetailView *idv = [[GBInfoDetailView alloc] initWithFrame:CGRectOffset(self.view.bounds, self.view.bounds.size.width*i, 0)];
            idv.tag = (TAG_START+i);
            [_scrollView addSubview:idv];
        }
    }
    self.title = [_infoList infoAtIndex:_currentIndex].title;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger lastIndex = _currentIndex;
    _currentIndex = scrollView.contentOffset.x/_scrollView.bounds.size.width;
    if (lastIndex != _currentIndex) {
        if (_currentIndex>lastIndex) {
            [[_scrollView viewWithTag:(TAG_START+lastIndex-1)] removeFromSuperview];
        }else{
            [[_scrollView viewWithTag:(TAG_START+lastIndex+1)] removeFromSuperview];
        }
        [self pageChanged];
    }
}

@end
