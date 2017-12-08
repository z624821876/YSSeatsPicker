//
//  YSSeatsPicker.h
//  ALAFanBei
//
//  Created by yu on 2017/12/6.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YSMovieSeat.h"

@class YSSeatsPicker;

@protocol YSSeatsPickerDelegate<NSObject>

@optional
- (BOOL)shouldSelectSeat:(YSMovieSeat *)seatInfo inPicker:(YSSeatsPicker *)picker;
- (BOOL)shouldDeselectSeat:(YSMovieSeat *)seatInfo inPicker:(YSSeatsPicker *)picker;

- (void)seatsPicker:(YSSeatsPicker *)picker didSelectSeat:(YSMovieSeat *)seatInfo;
- (void)seatsPicker:(YSSeatsPicker *)picker didDeselectSeat:(YSMovieSeat *)seatInfo;

- (void)selectionDidChangeInSeatsPicker:(YSSeatsPicker *)picker;

@end

@interface YSSeatsPicker : UIScrollView

@property (nonatomic, weak) id<YSSeatsPickerDelegate> seatsDelegate;

@property (nonatomic, assign) CGSize    cellSize;

/** 行间距 */
@property (nonatomic, assign) CGFloat   lineSpacing;

/** 列间距 */
@property (nonatomic, assign) CGFloat   columnSpacing;

/** 大厅名字 */
@property (nonatomic, copy) NSString  *hallName;

/** 大厅名字背景图 */
@property (nonatomic, strong) UIImage   *hallLogoImage;

/** 影院logo */
@property (nonatomic, strong) UIImage   *cinemaLogoImage;

@property (nonatomic, copy) NSArray<YSMovieSeat *>   *seats;

@property (nonatomic, readonly, copy) NSMutableArray<YSMovieSeat *>   *selectSeats;


/**
 刷新数据
 */
- (void)reloadData;

/**
 用来调整frame后的更新
 */
- (void)updateSeatsView;

@end
