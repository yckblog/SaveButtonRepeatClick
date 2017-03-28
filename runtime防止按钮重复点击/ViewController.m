//
//  ViewController.m
//  runtime防止按钮重复点击
//
//  Created by yzl on 17/3/28.
//  Copyright © 2017年 yzl. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+Extension.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor greenColor];
    button.titleLabel.text = @"我要点";
    button.yck_acceptEventInterval = 3;
    button.frame = CGRectMake(100, 200, 150, 30);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnClick
{
    NSLog(@"我打印");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
