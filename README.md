# YSSeatsPicker

[![CI Status](http://img.shields.io/travis/yu/YSSeatsPicker.svg?style=flat)](https://travis-ci.org/yu/YSSeatsPicker)
[![Version](https://img.shields.io/cocoapods/v/YSSeatsPicker.svg?style=flat)](http://cocoapods.org/pods/YSSeatsPicker)
[![License](https://img.shields.io/cocoapods/l/YSSeatsPicker.svg?style=flat)](http://cocoapods.org/pods/YSSeatsPicker)
[![Platform](https://img.shields.io/cocoapods/p/YSSeatsPicker.svg?style=flat)](http://cocoapods.org/pods/YSSeatsPicker)

## 前言:
高仿猫眼选票模块，因为公司业务需求，要对接猫眼电影，网上也没有很完整的库，所以就结合了网上已有的几个库封装一个符合公司要求的库。

在基础的选座功能上实现了情侣座的选择和是否落单的判断

## Example

![](blob:http://www.gif5.net/6fc722f7-8491-434a-8b07-c1aa35123add)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Demo中的数据为真实猫眼电影座位数据

创建SeatsView:

```
#import "YSSeatsPickerHeader.h"

ZYSSeatsPicker *picker = [ZYSSeatsPicker new];
picker.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 500);
picker.seats = section.seats;
[self.view addSubview:picker];
```

展示数据:
```
[picker reloadData];
```

更新Frame后需要刷新:
```
[picker updateSeatsView];
```

校验是否落单:
```
[ZYSMovieTools checkSeatsWhetherAloneWithSelectsSeats:picker.selectSeats forSeats:picker.seats];
```

## Requirements

## Installation

YSSeatsPicker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'YSSeatsPicker'
```

## Author

yu, yu624821876@163.com

## License

YSSeatsPicker is available under the MIT license. See the LICENSE file for more info.
