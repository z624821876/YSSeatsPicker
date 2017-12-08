//
//  YSSeatsIndexView.m
//  ALAFanBei
//
//  Created by yu on 2017/12/7.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import "YSSeatsIndexView.h"

#import <UIView+YSAddition.h>

@implementation YSSeatsIndexView
{
    CGFloat _topInset;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.layer.masksToBounds = YES;
        
        self.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.6];
        _topInset = 10;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    if (_indexList.count) {
        NSDictionary *attributeName = @{NSFontAttributeName:[UIFont systemFontOfSize:10], NSForegroundColorAttributeName:[UIColor whiteColor]};

        [_indexList enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CGSize strsize = [obj sizeWithAttributes:attributeName];
            
            [obj drawAtPoint:CGPointMake(self.width * 0.5 - strsize.width  * 0.5, _topInset + idx * (_lineSpacing + _itemHeight) + (_itemHeight - strsize.height) / 2.0) withAttributes:attributeName];
        }];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = CGRectGetWidth(self.bounds) / 2;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
