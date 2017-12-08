//
//  ZYSCenterLineView.m
//  ALAFanBei
//
//  Created by yu on 2017/12/6.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import "ZYSCenterLineView.h"

#import <UIView+YSAddition.h>

@interface ZYSCenterLineView ()
{
    UILabel *_centerLabel;
}

@end

@implementation ZYSCenterLineView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self initSubviews];
        
    }
    return self;
}

- (void)initSubviews {
    _centerLabel = [UILabel new];
    _centerLabel.textAlignment = NSTextAlignmentCenter;
    _centerLabel.text = @"银幕中央";
    _centerLabel.textColor = [UIColor darkGrayColor];
    _centerLabel.font = [UIFont systemFontOfSize:8];
    _centerLabel.userInteractionEnabled = NO;
    _centerLabel.layer.masksToBounds = YES;
    _centerLabel.layer.borderWidth = 0.5;
    _centerLabel.layer.cornerRadius = 5;
    _centerLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _centerLabel.layer.borderColor = [UIColor darkGrayColor].CGColor;
    [self addSubview:_centerLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _centerLabel.width = 50;
    _centerLabel.height = 15;
    _centerLabel.top = -15;
    _centerLabel.centerX = self.width * 0.5;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, [UIColor darkGrayColor].CGColor);
    CGFloat lengths[] = {6, 3};
    CGContextSetLineDash(context, 0, lengths, 2);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 0, self.bounds.size.height);
    CGContextStrokePath(context);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
