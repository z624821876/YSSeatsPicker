//
//  ZYSMovieSection.m
//  ALAFanBei
//
//  Created by yu on 2017/12/6.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import "ZYSMovieSection.h"

@implementation ZYSMovieSection

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"seats": [ZYSMovieSeat class]};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID": @"id"};
}

@end
