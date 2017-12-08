//
//  YSMovieSeat.m
//  ALAFanBei
//
//  Created by yu on 2017/12/6.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import "YSMovieSeat.h"

@implementation YSMovieSeat

/**
 字典转模型后自动调用
 */
- (void)mj_keyValuesDidFinishConvertingToObject {

    if ([self.status isEqualToString:@"E"]) {
        self.type = YSMovieSeatTypeCorridor;
    }else if ([self.status isEqualToString:@"LK"]) {
        self.type = YSMovieSeatTypeDisabled;
    }else if ([self.status isEqualToString:@"N"]) {
        self.type = YSMovieSeatTypeNormal;
    }else if ([self.status isEqualToString:@"L"]) {
        self.type = YSMovieSeatTypeLoversLeft;
    }else if ([self.status isEqualToString:@"R"]) {
        self.type = YSMovieSeatTypeLoversRight;
    }else if ([self.status isEqualToString:@"LD"]) {
        self.type = YSMovieSeatTypeLoversLeftDisabled;
    }else if ([self.status isEqualToString:@"RD"]) {
        self.type = YSMovieSeatTypeLoversRightDisabled;
    }
}

@end
