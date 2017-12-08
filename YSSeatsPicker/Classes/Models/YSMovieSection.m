//
//  YSMovieSection.m
//  ALAFanBei
//
//  Created by yu on 2017/12/6.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import "YSMovieSection.h"

@implementation YSMovieSection

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"seats": [YSMovieSeat class]};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID": @"id"};
}

@end
