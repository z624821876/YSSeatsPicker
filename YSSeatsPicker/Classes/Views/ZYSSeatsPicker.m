//
//  ZYSSeatsPicker.m
//  ALAFanBei
//
//  Created by yu on 2017/12/6.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import "ZYSSeatsPicker.h"
#import "ZYSSeatsButton.h"
#import "ZYSHallLogoView.h"
#import "ZYSCenterLineView.h"
#import "ZYSSeatsIndexView.h"
#import "ZYSIndicatorView.h"

#import "ZYSMovieTools.h"
#import <UIView+YSAddition.h>

@interface ZYSSeatsPicker ()<UIScrollViewDelegate>
{
    UIView *_contentView;
    ZYSHallLogoView *_hallLogoView;
    ZYSCenterLineView *_centerLineView;
    ZYSSeatsIndexView *_indexView;
    ZYSIndicatorView *_indicatorView;
    UIImageView *_appLogoView;
    
    CGSize _expectationSize;
    
    /** 按钮数组 */
    NSArray<UIButton *> *_buttons;
    
    NSMutableArray<NSString *> *_indexArray;

    UIEdgeInsets _boundsInset;

    struct {
        BOOL responseToShouldSelectSeat: 1;
        BOOL responseToShouldDeselectSeat: 1;
        BOOL responseToDidSelectSeat: 1;
        BOOL responseToDidDeselectSeat: 1;
        BOOL responseToSelectionChanged: 1;
    } _flags;
}

@property (nonatomic, copy) NSMutableArray<ZYSMovieSeat *>   *selectSeats;

@end

@implementation ZYSSeatsPicker

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
      
        _hallLogoImage = [ZYSMovieTools movieBundleImageWithImageNamed:@"may_mreserve_seat_screen_img"];
        _cinemaLogoImage = [ZYSMovieTools movieBundleImageWithImageNamed:@"may_mreserve_brand_icon"];
        _hallName = @"IMAX";
        
        _cellSize = CGSizeMake(30, 27);
        _lineSpacing = 10;
        _columnSpacing = 10;
        _boundsInset = UIEdgeInsetsMake(60 + _hallLogoImage.size.height, 35, 40 + _cinemaLogoImage.size.height, 35);

        self.delegate = self;
        self.minimumZoomScale = 0.5;
        self.maximumZoomScale = 1.5;
        self.canCancelContentTouches = NO;

    }
    return self;
}

- (void)reloadData {
    
    [self removeAllSubviews];
    _buttons = nil;
    _selectSeats = [NSMutableArray array];
    
    if (!_seats.count) {
        if (_flags.responseToSelectionChanged) {
            [_seatsDelegate selectionDidChangeInSeatsPicker:self];
        }
        return;
    }
    
    [self buildSeatsView];

    _centerLineView = [ZYSCenterLineView new];
    _centerLineView.width = 1;
    [self addSubview:_centerLineView];
    
    _hallLogoView = [[ZYSHallLogoView alloc] init];
    _hallLogoView.hallName = _hallName;
    _hallLogoView.hallLogo = _hallLogoImage;
    _hallLogoView.size = _hallLogoImage.size;
    [self addSubview:_hallLogoView];

    _appLogoView = [UIImageView new];
    _appLogoView.image = _cinemaLogoImage;
    _appLogoView.size = _cinemaLogoImage.size;
    [self addSubview:_appLogoView];
    
    _indexView = [ZYSSeatsIndexView new];
    _indexView.indexList = _indexArray;
    _indexView.itemHeight = _cellSize.height;
    _indexView.lineSpacing = _lineSpacing;
    [self addSubview:_indexView];
    
    _indicatorView = [[ZYSIndicatorView alloc] initWithSeatsView:_contentView];
    _indicatorView.hallLogoImage = _hallLogoImage;
    [self addSubview:_indicatorView];
    CGFloat width = self.width / 3.0 + 6;
    CGFloat height = (self.width / 3.0) / _contentView.width * _contentView.height + 12;
    _indicatorView.size = CGSizeMake(width, height);

    [self p_layoutSubviews];
    
    if (self.contentSize.width > self.width) {
        self.contentOffset = CGPointMake((self.contentSize.width - self.width) / 2.0, 0);
    }
    
    [self startAnimation];
}

- (void)updateSeatsView {
    
    CGFloat width = self.width / 3.0 + 6;
    CGFloat height = (self.width / 3.0) / _contentView.width * _contentView.height + 12;
    _indicatorView.size = CGSizeMake(width, height);
    
    [self p_layoutSubviews];
}

- (void)buildSeatsView {

    _contentView = [UIView new];
    _contentView.backgroundColor = [UIColor clearColor];
    [self addSubview:_contentView];
    
    __block NSInteger maxColumn = 0;
    __block NSInteger maxRow = 0;
    _indexArray = [NSMutableArray array];
    [_seats enumerateObjectsUsingBlock:^(ZYSMovieSeat *seatModel, NSUInteger idx, BOOL *stop) {
        if (_indexArray.count < seatModel.rowNo) {
            [_indexArray addObject:@""];
        }
        
        if (seatModel.type != ZYSMovieSeatTypeCorridor && seatModel.type != ZYSMovieSeatTypeLoversRight && seatModel.type != ZYSMovieSeatTypeLoversRightDisabled) {
            ZYSSeatsButton *seatBtn = [ZYSSeatsButton buttonWithType:UIButtonTypeCustom];
            seatBtn.tag = idx;
            seatBtn.seatmodel = seatModel;
            [seatBtn addTarget:self action:@selector(seatBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [_contentView addSubview:seatBtn];
            
            NSInteger columnNo = seatModel.columnNo - 1;
            NSInteger rowNo = seatModel.rowNo - 1;
            if (seatModel.type == ZYSMovieSeatTypeLoversLeft || seatModel.type == ZYSMovieSeatTypeLoversLeftDisabled) {
                //情侣座位单独计算
                
                seatBtn.frame = (CGRect){
                    columnNo * (_cellSize.width + _columnSpacing),
                    rowNo * (_cellSize.height + _lineSpacing),
                    
                    _cellSize.width * 2 + _columnSpacing,
                    _cellSize.height
                };
        
            }else {
                seatBtn.frame = (CGRect){
                    columnNo * (_cellSize.width + _columnSpacing),
                    rowNo * (_cellSize.height + _lineSpacing),
                
                    _cellSize.width,
                    _cellSize.height
                };
            }
            
            [_indexArray replaceObjectAtIndex:seatModel.rowNo - 1 withObject:seatModel.rowId];
        }
        
        maxColumn = MAX(maxColumn, seatModel.columnNo);
        maxRow = MAX(maxRow, seatModel.rowNo);
    }];

    _expectationSize = (CGSize){
        maxColumn == 1 ? _cellSize.width : maxColumn * (_cellSize.width + _columnSpacing) - _columnSpacing,
        maxRow == 1 ? _cellSize.height : maxRow * (_cellSize.height + _lineSpacing) - _lineSpacing
    };
    _contentView.size = CGSizeMake(_expectationSize.width, _expectationSize.height);
    _contentView.centerX = MAX(self.width / 2.0, _contentView.size.width / 2.0);
    _contentView.top = _boundsInset.top;
}

- (void)p_layoutSubviews {
    
    self.contentSize = CGSizeMake(MAX(_contentView.size.width + _boundsInset.left + _boundsInset.right, self.width), _contentView.size.height + _boundsInset.top + _boundsInset.bottom);
    
    _contentView.top = _boundsInset.top;
    _contentView.centerX = MAX(self.bounds.size.width / 2, self.contentSize.width / 2);
    
    _hallLogoView.top = self.contentOffset.y;
    _hallLogoView.centerX = _contentView.centerX;
    
    _appLogoView.top = _contentView.bottom + 30;
    _appLogoView.centerX = _contentView.centerX;
    
    _centerLineView.centerX = _contentView.centerX;
    if (self.contentOffset.y > 0) {
        _centerLineView.top = self.contentOffset.y + _boundsInset.top - 20;
    }else {
        _centerLineView.top = _contentView.top - 20;
    }
    _centerLineView.height = _contentView.bottom - _centerLineView.top + 10;
    
    [_centerLineView setNeedsDisplay];
    
    _indexView.frame = CGRectMake(self.contentOffset.x + 10, _contentView.top - 10, 14, _contentView.height + 20);
    _indexView.itemHeight = self.zoomScale * _cellSize.height;
    _indexView.lineSpacing = self.zoomScale * _lineSpacing;
    [_indexView setNeedsDisplay];
 
    _indicatorView.origin = CGPointMake(self.contentOffset.x, self.contentOffset.y);
    CGRect displayFrame = CGRectMake(self.contentOffset.x, self.contentOffset.y, self.width, self.height);
    CGRect contentDisplayFrame = CGRectIntersection(displayFrame, _contentView.frame);
    contentDisplayFrame = [self convertRect:contentDisplayFrame toView:_contentView];
    CGFloat scale = (_indicatorView.width - 6) / _contentView.width;
    [_indicatorView updateMiniIndicatorWithDisplayRect:(CGRect){
        contentDisplayFrame.origin.x * scale * self.zoomScale,
        contentDisplayFrame.origin.y * scale * self.zoomScale,
        contentDisplayFrame.size.width * scale * self.zoomScale,
        contentDisplayFrame.size.height * scale * self.zoomScale
    }];

}

#pragma mark - Action

- (void)startAnimation {
    
    [self setZoomScale:0.5 animated:NO];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.4 animations:^{
            [self setZoomScale:1.0 animated:NO];
            self.contentOffset = CGPointMake(self.contentSize.width / 2.0 - self.width / 2.0, 0);
        }];
    });
}

- (void)seatBtnAction:(ZYSSeatsButton *)button {
    
    BOOL isScale = NO;
    
    ZYSMovieSeat *seat = _seats[button.tag];

    if (button.selected) {
    
            //没有实现代理 OR 获取代理返回YES
        if (!_flags.responseToShouldDeselectSeat || [_seatsDelegate shouldDeselectSeat:seat inPicker:self]) {
            
            button.selected = NO;
            seat.selected = NO;
            
            isScale = YES;
            if (seat.type == ZYSMovieSeatTypeLoversLeft && _seats.count > button.tag + 1) {
                [_selectSeats removeObject:_seats[button.tag + 1]];
            }
            
            [_selectSeats removeObject:seat];
            if (_flags.responseToDidDeselectSeat) {
                [_seatsDelegate seatsPicker:self didDeselectSeat:seat];
            }
            if (_flags.responseToSelectionChanged) {
                [_seatsDelegate selectionDidChangeInSeatsPicker:self];
            }
        }
    }else {
        if (!_flags.responseToShouldSelectSeat || [_seatsDelegate shouldSelectSeat:seat inPicker:self]) {
           
            button.selected = YES;
            seat.selected = YES;
            isScale = YES;
            
            if (seat.type == ZYSMovieSeatTypeLoversLeft && _seats.count > button.tag + 1) {
                [_selectSeats addObject:_seats[button.tag + 1]];
            }

            [_selectSeats addObject:_seats[button.tag]];

            if (_flags.responseToDidSelectSeat) {
                [_seatsDelegate seatsPicker:self didSelectSeat:seat];
            }
            if (_flags.responseToSelectionChanged) {
                [_seatsDelegate selectionDidChangeInSeatsPicker:self];
            }
        }
    }
    
    if (isScale) {
        
        if (self.maximumZoomScale - self.zoomScale > 0.1) {
            [self zoomToRect:[self _zoomRectInView:self forScale:self.maximumZoomScale withCenter:button.center] animated:YES];
        }
        
        [_indicatorView updateIndicatorImage];
    }
}

- (CGRect)_zoomRectInView:(UIView *)view forScale:(CGFloat)scale withCenter:(CGPoint)center {
    CGRect zoomRect;
    zoomRect.size.height = view.bounds.size.height / scale;
    zoomRect.size.width = view.bounds.size.width / scale;
    zoomRect.origin.x = center.x - (zoomRect.size.width / 2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
    return zoomRect;
}

#pragma mark - Properties

- (void)setSeatsDelegate:(id<ZYSSeatsPickerDelegate>)seatsDelegate {
    _seatsDelegate = seatsDelegate;
    
    _flags.responseToShouldSelectSeat = [_seatsDelegate respondsToSelector:@selector(shouldSelectSeat:inPicker:)];
    _flags.responseToShouldDeselectSeat = [_seatsDelegate respondsToSelector:@selector(shouldDeselectSeat:inPicker:)];
    _flags.responseToDidSelectSeat = [_seatsDelegate respondsToSelector:@selector(seatsPicker:didSelectSeat:)];
    _flags.responseToDidDeselectSeat = [_seatsDelegate respondsToSelector:@selector(seatsPicker:didDeselectSeat:)];
    _flags.responseToSelectionChanged = [_seatsDelegate respondsToSelector:@selector(selectionDidChangeInSeatsPicker:)];
}

#pragma mark - ScrollView Delegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _contentView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {

    [self p_layoutSubviews];
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    [self p_layoutSubviews];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self p_layoutSubviews];
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
    return YES;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
