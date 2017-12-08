//
//  YSMovieTools.h
//  ALAFanBei
//
//  Created by yu on 2017/12/8.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSMovieTools : NSObject


/**
 获取MovieBundle中的图片
 */
+ (UIImage *)movieBundleImageWithImageNamed:(NSString *)imageName;


/**
 截图
 */
+ (UIImage *)snapshotImageWithView:(UIView *)view;


/**
 检查选中座位是否落单
 
 @return YES  落单  NO 未落单
 */
+ (BOOL)checkSeatsWhetherAloneWithSelectsSeats:(NSArray *)selectSeats forSeats:(NSArray *)seats;

@end
