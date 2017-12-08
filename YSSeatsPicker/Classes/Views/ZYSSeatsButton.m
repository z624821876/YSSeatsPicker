//
//  ZYSSeatsButton.m
//  ALAFanBei
//
//  Created by yu on 2017/12/6.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import "ZYSSeatsButton.h"
#import "ZYSMovieTools.h"

@implementation ZYSSeatsButton

- (void)setHighlighted:(BOOL)highlighted {}

- (void)setSeatmodel:(ZYSMovieSeat *)seatmodel {
    _seatmodel = seatmodel;
    
    self.userInteractionEnabled = NO;
    switch (_seatmodel.type) {
        case ZYSMovieSeatTypeNormal:
        {
            [self setBackgroundImage:[ZYSMovieTools movieBundleImageWithImageNamed:@"may_mreserve_seat_sample_img_available"] forState:UIControlStateNormal];
            [self setBackgroundImage:[ZYSMovieTools movieBundleImageWithImageNamed:@"may_mreserve_seat_sample_img_selected"] forState:UIControlStateSelected];
            self.userInteractionEnabled = YES;
        }
            break;
        case ZYSMovieSeatTypeDisabled:
        {
            [self setBackgroundImage:[ZYSMovieTools movieBundleImageWithImageNamed:@"may_mreserve_seat_sample_img_sold"] forState:UIControlStateNormal];
        }
            break;
        case ZYSMovieSeatTypeCorridor:
        {
        }
            break;
        case ZYSMovieSeatTypeLoversLeft:
        {
            [self setBackgroundImage:[ZYSMovieTools movieBundleImageWithImageNamed:@"may_mreserve_seat_sample_img_couple"] forState:UIControlStateNormal];
            [self setBackgroundImage:[ZYSMovieTools movieBundleImageWithImageNamed:@"may_mreserve_seat_couple_img_selected"] forState:UIControlStateSelected];
            self.userInteractionEnabled = YES;
        }
            break;
        case ZYSMovieSeatTypeLoversLeftDisabled:
        {
            [self setBackgroundImage:[ZYSMovieTools movieBundleImageWithImageNamed:@"may_mreserve_seat_couple_img_sold"] forState:UIControlStateNormal];
        }
            break;
        case ZYSMovieSeatTypeLoversRight:
        {
        }
            break;
        case ZYSMovieSeatTypeLoversRightDisabled:
        {
        }
            break;

            
        default:
            break;
    }
}

@end
