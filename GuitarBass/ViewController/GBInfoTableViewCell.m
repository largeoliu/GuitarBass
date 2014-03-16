//
//  GBInfoTableViewCell.m
//  GuitarBass
//
//  Created by DEV_LiuHao on 14-3-16.
//  Copyright (c) 2014年 tinmanarts. All rights reserved.
//

#import "GBInfoTableViewCell.h"
#define InfoCellHeight 85.0f
#define InfoTitleWidth 230.0f

@implementation GBInfoTableViewCell

+ (CGFloat)height
{
    return InfoCellHeight;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _thumbImageView  = [[EGOImageView alloc] initWithPlaceholderImage:nil];
        _thumbImageView.frame = CGRectMake(10, 0, 60, 60);
    
        _thumbImageView.center = CGPointMake(_thumbImageView.center.x, InfoCellHeight/2);
        [self addSubview:_thumbImageView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_thumbImageView.frame)+10, CGRectGetMinY(_thumbImageView.frame), InfoTitleWidth, CGRectGetHeight(_thumbImageView.frame))];
        _titleLabel.numberOfLines = 3;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _titleLabel.contentMode = UIViewContentModeTop;
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [self addSubview:_titleLabel];
        
    }
    return self;
}

- (void)loadWithInfo:(GBInfoModel*)info
{
    _info = info;
    
    _titleLabel.text = info.title;
    CGSize size = CGSizeMake(InfoTitleWidth, CGRectGetHeight(_thumbImageView.frame));
    CGSize labelsize = [info.title sizeWithFont:_titleLabel.font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    _titleLabel.frame = CGRectMake(_titleLabel.frame.origin.x, _titleLabel.frame.origin.y, labelsize.width, labelsize.height);

    _thumbImageView.imageURL = [NSURL URLWithString:info.thumbUrl];
}

@end
