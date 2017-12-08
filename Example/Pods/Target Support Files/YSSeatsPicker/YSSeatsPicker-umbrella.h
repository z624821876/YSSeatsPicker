#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "YSMovieSeat.h"
#import "YSMovieSection.h"
#import "YSMovieTools.h"
#import "UIView+YSAddition.h"
#import "YSCenterLineView.h"
#import "YSHallLogoView.h"
#import "YSIndicatorView.h"
#import "YSSeatsButton.h"
#import "YSSeatsIndexView.h"
#import "YSSeatsPicker.h"
#import "YSSeatsPickerHeader.h"

FOUNDATION_EXPORT double YSSeatsPickerVersionNumber;
FOUNDATION_EXPORT const unsigned char YSSeatsPickerVersionString[];

