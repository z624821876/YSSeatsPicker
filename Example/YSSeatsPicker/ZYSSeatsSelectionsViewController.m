//
//  ZYSSeatsSelectionsViewController.m
//  ALAFanBei
//
//  Created by yu on 2017/12/6.
//  Copyright © 2017年 阿拉丁. All rights reserved.
//

#import "ZYSSeatsSelectionsViewController.h"

#import "YSSeatsPickerHeader.h"

#import "MJExtension.h"

@interface ZYSSeatsSelectionsViewController ()

@property (nonatomic, strong) ZYSSeatsPicker    *picker;

@end

@implementation ZYSSeatsSelectionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"Movie.plist"] ofType:nil];
    NSDictionary *seatsDic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *array = [ZYSMovieSection mj_objectArrayWithKeyValuesArray:seatsDic[@"sections"]];
    ZYSMovieSection *section = [array firstObject];
    
    _picker = [ZYSSeatsPicker new];
    _picker.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 500);
    _picker.seats = section.seats;
    [self.view addSubview:_picker];
    
    [_picker reloadData];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([ZYSMovieTools checkSeatsWhetherAloneWithSelectsSeats:_picker.selectSeats forSeats:_picker.seats]) {
        NSLog(@"********************************");
        NSLog(@"**************落单***************");
        NSLog(@"********************************");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
