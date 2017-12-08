//
//  ZYSHallLogoView.m
//  ALAFanBei
//
//  Created by yu on 2017/12/6.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import "ZYSHallLogoView.h"
#import "ZYSMovieTools.h"

@interface ZYSHallLogoView ()

@end

@implementation ZYSHallLogoView

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];

    }
    return self;
}

- (void)setHallName:(NSString *)hallName {
    
    _hallName = hallName;
    [self setNeedsDisplay];
}

// 绘制图片
- (void)drawRect:(CGRect)rect {

    UIImage *image = [ZYSMovieTools movieBundleImageWithImageNamed:@"may_mreserve_seat_screen_img"];//这里更换你影厅图标
    [image drawInRect:rect];

    NSDictionary *attributeName = @{NSFontAttributeName: [UIFont systemFontOfSize:9],NSForegroundColorAttributeName : [UIColor darkGrayColor]};
    CGSize strsize = [self.hallName sizeWithAttributes:attributeName];
    [self.hallName drawAtPoint:CGPointMake(image.size.width / 2 - strsize.width / 2,image.size.height / 2 - strsize.height / 2)
                withAttributes:attributeName];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
