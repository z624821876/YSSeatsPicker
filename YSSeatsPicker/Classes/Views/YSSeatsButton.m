//
//  YSSeatsButton.m
//  ALAFanBei
//
//  Created by yu on 2017/12/6.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import "YSSeatsButton.h"
#import "YSMovieTools.h"

@implementation YSSeatsButton

- (void)setHighlighted:(BOOL)highlighted {}

- (void)setSeatmodel:(YSMovieSeat *)seatmodel {
    _seatmodel = seatmodel;
    
    self.userInteractionEnabled = NO;
    switch (_seatmodel.type) {
        case YSMovieSeatTypeNormal:
        {
            [self setBackgroundImage:[YSMovieTools movieBundleImageWithImageNamed:@"may_mreserve_seat_sample_img_available"] forState:UIControlStateNormal];
            [self setBackgroundImage:[YSMovieTools movieBundleImageWithImageNamed:@"may_mreserve_seat_sample_img_selected"] forState:UIControlStateSelected];
            self.userInteractionEnabled = YES;
        }
            break;
        case YSMovieSeatTypeDisabled:
        {
            [self setBackgroundImage:[YSMovieTools movieBundleImageWithImageNamed:@"may_mreserve_seat_sample_img_sold"] forState:UIControlStateNormal];
        }
            break;
        case YSMovieSeatTypeCorridor:
        {
        }
            break;
        case YSMovieSeatTypeLoversLeft:
        {
            [self setBackgroundImage:[YSMovieTools movieBundleImageWithImageNamed:@"may_mreserve_seat_sample_img_couple"] forState:UIControlStateNormal];
            [self setBackgroundImage:[YSMovieTools movieBundleImageWithImageNamed:@"may_mreserve_seat_couple_img_selected"] forState:UIControlStateSelected];
            self.userInteractionEnabled = YES;
        }
            break;
        case YSMovieSeatTypeLoversLeftDisabled:
        {
            [self setBackgroundImage:[YSMovieTools movieBundleImageWithImageNamed:@"may_mreserve_seat_couple_img_sold"] forState:UIControlStateNormal];
        }
            break;
        case YSMovieSeatTypeLoversRight:
        {
        }
            break;
        case YSMovieSeatTypeLoversRightDisabled:
        {
        }
            break;

            
        default:
            break;
    }
}

@end
