//
//  ZYSIndicatorView.m
//  ALAFanBei
//
//  Created by yu on 2017/12/6.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import "ZYSIndicatorView.h"
#import "ZYSMovieTools.h"

#import <UIView+YSAddition.h>

@implementation ZYSIndicatorView
{
    UIView      *_seatsView;
    
    UIImageView *_mapView;
    
    UIView      *_indicatorView;
    
    CGRect      _displayRect;
    
    UIImage     *_mapImage;
    
}

- (instancetype)initWithSeatsView:(UIView *)seatsView {
    self = [super init];
    if (self) {
        _seatsView = seatsView;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
        
//        _mapView = [UIImageView new];
//        [self addSubview:_mapView];
        
        _indicatorView = [UIView new];
        _indicatorView.layer.borderColor = [UIColor redColor].CGColor;
        _indicatorView.layer.borderWidth = 2.0f;
        [self addSubview:_indicatorView];
    
        [self updateIndicatorImage];
    }
    return self;
}

/**
 刷新
 */
- (void)updateIndicatorImage {

    _mapImage = [ZYSMovieTools snapshotImageWithView:_seatsView];
    
    [self setNeedsDisplay];
    [self showIndicator];
}

/**
 刷新选中范围
 */
- (void)updateMiniIndicatorWithDisplayRect:(CGRect)rect {
    _displayRect = rect;
    
    [self setNeedsLayout];
    [self showIndicator];
}

- (void)showIndicator {
    self.alpha = 1;
    self.hidden = NO;
    [self.class cancelPreviousPerformRequestsWithTarget:self];
    [self performSelector:@selector(indicatorHidden) withObject:nil afterDelay:3.0];
}

/**
 隐藏
 */
- (void)indicatorHidden {
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0.5;
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    _mapView.frame = CGRectMake(3, 9, self.width - 6, self.height - 12);

    _indicatorView.frame = (CGRect){
        //加上内容的偏移  减去边框的宽度
        _displayRect.origin.x + 3 - 2,
        _displayRect.origin.y + 9 - 2,
        _displayRect.size.width + 4,
        _displayRect.size.height + 4
    };
}

- (void)drawRect:(CGRect)rect {
    
    UIImage *logoImage = [UIImage imageNamed:@"screenBg"];
    [logoImage drawInRect:CGRectMake(2 * 3, 3, self.width - 4 * 3, 3)];
    
    [_mapImage drawInRect:CGRectMake(3, 9, self.width - 6, self.height - 12)];
    _mapImage = nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
