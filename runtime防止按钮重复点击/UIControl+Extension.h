//
//  UIControl+Extension.h
//  runtime防止按钮重复点击
//
//  Created by yzl on 17/3/28.
//  Copyright © 2017年 yzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (Extension)

@property (nonatomic, assign) NSTimeInterval yck_acceptEventInterval;// 可以用这个给重复点击加间隔

@end
