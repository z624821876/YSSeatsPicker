//
//  ZYSIndicatorView.h
//  ALAFanBei
//
//  Created by yu on 2017/12/6.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYSIndicatorView : UIView

@property (nonatomic, strong) UIImage   *hallLogoImage;

- (instancetype)initWithSeatsView:(UIView *)seatsView;

/**
 刷新座位图
 */
- (void)updateIndicatorImage;


/**
 刷新选中范围
 */
- (void)updateMiniIndicatorWithDisplayRect:(CGRect)rect;

/**
 隐藏
 */
- (void)indicatorHidden; 

@end
