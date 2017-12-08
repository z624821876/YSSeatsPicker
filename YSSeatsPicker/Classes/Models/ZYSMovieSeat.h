//
//  ZYSMovieSeat.h
//  ALAFanBei
//
//  Created by yu on 2017/12/6.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ZYSMovieSeatType) {
    ZYSMovieSeatTypeCorridor = 0,           //走廊
    ZYSMovieSeatTypeDisabled,               //不可售
    ZYSMovieSeatTypeNormal,                 //普通可售
    ZYSMovieSeatTypeLoversLeft,             //情侣左可售
    ZYSMovieSeatTypeLoversRight,            //情侣右可售
    ZYSMovieSeatTypeLoversLeftDisabled,     //情侣左不可售
    ZYSMovieSeatTypeLoversRightDisabled     //情侣右不可售
};

@interface ZYSMovieSeat : NSObject

/* 用来显示编号 */
/** 列号 不包含空行 */
@property (nonatomic, copy) NSString  *columnId;

/** 行号 不包含空行 */
@property (nonatomic, copy) NSString  *rowId;


/* 用来计算位置 */
/** 列坐标 */
@property (nonatomic, assign) NSInteger columnNo;

/** 行坐标 */
@property (nonatomic, assign) NSInteger rowNo;

/** 座位编号 */
@property (nonatomic, assign) NSInteger seatNo;

@property (nonatomic, assign) ZYSMovieSeatType  type;

    //extension
@property (nonatomic, assign) BOOL  selected;

/**
 座位类型
 E:走廊 LK:不可售 N:普通可售 L:情侣左可售 R:情侣右可售 LD:情侣左不可售 RD:情侣右不可售
 */
@property (nonatomic, strong) NSString  *status;

@end
