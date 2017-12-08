//
//  ZYSSeatsIndexView.h
//  ALAFanBei
//
//  Created by yu on 2017/12/7.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYSSeatsIndexView : UIView

@property (nonatomic, strong) NSArray<NSString*> *indexList;

@property (nonatomic, strong) UIColor *indexNumColor;

@property (nonatomic, strong) UIFont *indexNumFont;

@property (nonatomic, assign) CGFloat   itemHeight;

@property (nonatomic, assign) CGFloat   lineSpacing;

@end
