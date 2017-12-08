//
//  ZYSMovieTools.m
//  ALAFanBei
//
//  Created by yu on 2017/12/8.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import "ZYSMovieTools.h"

#import "ZYSMovieSeat.h"

@implementation ZYSMovieTools

+ (UIImage *)movieBundleImageWithImageNamed:(NSString *)imageName {
    
    NSString *path = [[NSBundle bundleForClass:self] pathForResource:@"ZYSMovie" ofType:@"bundle"];
    NSString *imagePath = [NSString stringWithFormat:@"%@/%@", path, imageName];
    return [UIImage imageNamed:imagePath];
}

+ (UIImage *)snapshotImageWithView:(UIView *)view {
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

/**
 检查选中座位是否落单
 
 * 检查规则:
 * 1. 只检查同行
 * 2. 不检查情侣座位
 * 3. 只有一边有空座位则为不落单
 * 4. 两边都有空座且至少有一边为单个座位为落单
 @return YES  落单  NO 未落单
 */
+ (BOOL)checkSeatsWhetherAloneWithSelectsSeats:(NSArray *)selectSeats forSeats:(NSArray *)seats {
    
    __block BOOL whetherAlone = NO;
    [selectSeats enumerateObjectsUsingBlock:^(ZYSMovieSeat *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 获取行号
        NSInteger rowNo = obj.rowNo;
        NSInteger columnNo = obj.columnNo;
        // 获取所有相同行数据
        NSString *str = [NSString stringWithFormat:@"SELF.rowNo == %zd", rowNo];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:str];
        NSArray *sameLineArray = [seats filteredArrayUsingPredicate:predicate];
        
        if (sameLineArray) {
            // 最开始和最末尾不判断落单  情侣座不判断落单
            if (sameLineArray.count == columnNo || columnNo == 1 || obj.type == ZYSMovieSeatTypeLoversLeft || obj.type == ZYSMovieSeatTypeLoversRight ||
                obj.type == ZYSMovieSeatTypeLoversLeftDisabled || obj.type == ZYSMovieSeatTypeLoversRightDisabled) {
                return;
            }
            
            NSInteger leftVacancy = 0;
            NSInteger rightVacancy = 0;
            // 搜索左边
            for (NSInteger i = columnNo - 2; i >= 0; i --) {
                ZYSMovieSeat *leftObj = sameLineArray[i];
                if (leftObj.type == ZYSMovieSeatTypeNormal) {
                    if (!leftObj.selected) {
                        leftVacancy ++;
                    }else if (leftVacancy != 0) {
                        break;
                    }
                }else {
                    break;
                }
            }
            // 搜索右边
            for (NSInteger i = columnNo; i < sameLineArray.count; i ++) {
                ZYSMovieSeat *rightObj = sameLineArray[i];
                if (rightObj.type == ZYSMovieSeatTypeNormal) {
                    if (!rightObj.selected) {
                        rightVacancy ++;
                    }else if (rightVacancy != 0) {
                        break;
                    }
                }else {
                    break;
                }
            }
            if ((leftVacancy > 0 && rightVacancy > 0) && (leftVacancy == 1 || rightVacancy == 1)) {
                whetherAlone = YES;
                *stop = YES;
                return;
            }
        }
    }];
    
    return whetherAlone;
}




@end
