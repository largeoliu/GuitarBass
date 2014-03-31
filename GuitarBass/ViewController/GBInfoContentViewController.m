//
//  GBInfoContentViewController.m
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-24.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBInfoContentViewController.h"
#import "GBInfoList.h"
#import "GBInfoModel.h"
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
    self.view.backgroundColor = [UIColor colorWithRed:29.0/255.0 green:29.0/255.0 blue:29.0/255.0 alpha:1.0];
    CGRect tableFrame = self.view.bounds;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {

    }else{
        
    }
    _scrollView = [[UIScrollView alloc] initWithFrame:tableFrame];
    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*_infoList.count, tableFrame.size.height-20);
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = YES;
    _scrollView.showsVerticalScrollIndicator = YES;
    [self.view addSubview:_scrollView];
    
    [self pageChanged];
    [_scrollView setContentOffset:CGPointMake(self.view.bounds.size.width*_currentIndex, 0) animated:NO];
    
    
    QBKOverlayMenuViewOffset offset;
    offset.bottomOffset = 0;
    
    QBKOverlayMenuView *_qbkOverlayMenu = [[QBKOverlayMenuView alloc] initWithDelegate:self position:kQBKOverlayMenuViewPositionBottom offset:offset];
    [_qbkOverlayMenu setParentView:self.view];
    [_qbkOverlayMenu addButtonWithImage:[UIImage imageNamed:@"rw-button.png"] index:0];
    [_qbkOverlayMenu addButtonWithImage:[UIImage imageNamed:@"rw-button.png"] index:1];
    [_qbkOverlayMenu addButtonWithImage:[UIImage imageNamed:@"rw-button.png"] index:2];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)pageChanged
{
    CGFloat offset = 0;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        offset = 20;
    }
    for (int i = _currentIndex-1; i <= _currentIndex+1; i++) {
        if (i >= 0 && i < _infoList.count&&![_scrollView viewWithTag:(TAG_START+i)]) {
            GBInfoDetailView *idv = [[GBInfoDetailView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width*i, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height-offset)];
            [idv loadWithInfo:[_infoList infoAtIndex:i]];
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


- (void)overlayMenuView:(QBKOverlayMenuView *)overlayMenuView didActivateAdditionalButtonWithIndex:(NSInteger)index
{
    if (index == 2) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didPerformUnfoldActionInOverlayMenuView:(QBKOverlayMenuView *)overlaymenuView
{

}

- (void)didPerformFoldActionInOverlayMenuView:(QBKOverlayMenuView *)overlaymenuView
{

}

@end
