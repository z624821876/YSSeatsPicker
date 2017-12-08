//
//  YSMovieSection.h
//  ALAFanBei
//
//  Created by yu on 2017/12/6.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "YSMovieSeat.h"

@interface YSMovieSection : NSObject

@property (nonatomic, strong) NSString  *ID;

@property (nonatomic, strong) NSString  *name;

@property (nonatomic, copy) NSArray<YSMovieSeat *>  *seats;

@end
