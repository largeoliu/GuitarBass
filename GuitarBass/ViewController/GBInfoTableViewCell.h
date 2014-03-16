//
//  GBInfoTableViewCell.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-16.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"
#import "GBInfoModel.h"

@interface GBInfoTableViewCell : UITableViewCell
{
    EGOImageView *_thumbImageView;
    UILabel *_titleLabel;
    
    GBInfoModel *_info;
}
+ (CGFloat)height;
- (void)loadWithInfo:(GBInfoModel*)info;
@end
