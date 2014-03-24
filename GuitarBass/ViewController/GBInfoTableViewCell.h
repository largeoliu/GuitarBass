//
//  GBInfoTableViewCell.h
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-16.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

@class EGOImageView;
@class GBInfoModel;
@interface GBInfoTableViewCell : UITableViewCell
{
    EGOImageView *_thumbImageView;
    UILabel *_titleLabel;
}
+ (CGFloat)height;
- (void)loadWithInfo:(GBInfoModel*)info;
@end
