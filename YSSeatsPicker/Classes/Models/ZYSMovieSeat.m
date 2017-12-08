//
//  ZYSMovieSeat.m
//  ALAFanBei
//
//  Created by yu on 2017/12/6.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import "ZYSMovieSeat.h"

@implementation ZYSMovieSeat

/**
 字典转模型后自动调用
 */
- (void)mj_keyValuesDidFinishConvertingToObject {

    if ([self.status isEqualToString:@"E"]) {
        self.type = ZYSMovieSeatTypeCorridor;
    }else if ([self.status isEqualToString:@"LK"]) {
        self.type = ZYSMovieSeatTypeDisabled;
    }else if ([self.status isEqualToString:@"N"]) {
        self.type = ZYSMovieSeatTypeNormal;
    }else if ([self.status isEqualToString:@"L"]) {
        self.type = ZYSMovieSeatTypeLoversLeft;
    }else if ([self.status isEqualToString:@"R"]) {
        self.type = ZYSMovieSeatTypeLoversRight;
    }else if ([self.status isEqualToString:@"LD"]) {
        self.type = ZYSMovieSeatTypeLoversLeftDisabled;
    }else if ([self.status isEqualToString:@"RD"]) {
        self.type = ZYSMovieSeatTypeLoversRightDisabled;
    }
}

@end
