//
//  ZYSSeatsPicker.h
//  ALAFanBei
//
//  Created by yu on 2017/12/6.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZYSMovieSeat.h"

@class ZYSSeatsPicker;

@protocol ZYSSeatsPickerDelegate<NSObject>

@optional
- (BOOL)shouldSelectSeat:(ZYSMovieSeat *)seatInfo inPicker:(ZYSSeatsPicker *)picker;
- (BOOL)shouldDeselectSeat:(ZYSMovieSeat *)seatInfo inPicker:(ZYSSeatsPicker *)picker;

- (void)seatsPicker:(ZYSSeatsPicker *)picker didSelectSeat:(ZYSMovieSeat *)seatInfo;
- (void)seatsPicker:(ZYSSeatsPicker *)picker didDeselectSeat:(ZYSMovieSeat *)seatInfo;

- (void)selectionDidChangeInSeatsPicker:(ZYSSeatsPicker *)picker;

@end

@interface ZYSSeatsPicker : UIScrollView

@property (nonatomic, weak) id<ZYSSeatsPickerDelegate> seatsDelegate;

@property (nonatomic, assign) CGSize    cellSize;

/** 行间距 */
@property (nonatomic, assign) CGFloat   lineSpacing;

/** 列间距 */
@property (nonatomic, assign) CGFloat   columnSpacing;

@property (nonatomic, strong) UIImage   *hallLogoImage;

@property (nonatomic, strong) UIImage   *cinemaLogoImage;

@property (nonatomic, copy) NSArray<ZYSMovieSeat *>   *seats;

@property (nonatomic, readonly, copy) NSMutableArray<ZYSMovieSeat *>   *selectSeats;


/**
 刷新数据
 */
- (void)reloadData;

/**
 用来调整frame后的更新
 */
- (void)updateSeatsView;

@end
