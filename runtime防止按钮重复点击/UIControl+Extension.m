//
//  UIControl+Extension.m
//  runtime防止按钮重复点击
//
//  Created by yzl on 17/3/28.
//  Copyright © 2017年 yzl. All rights reserved.
//

#import "UIControl+Extension.h"
#import <objc/runtime.h>

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";
static const char *UIControl_acceptEventTime = "UIControl_acceptEventTime";

@implementation UIControl (Extension)


- (NSTimeInterval)yck_acceptEventInterval
{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}
- (void)setYck_acceptEventInterval:(NSTimeInterval)yck_acceptEventInterval
{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(yck_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)cs_acceptEventTime {
    return  [objc_getAssociatedObject(self, UIControl_acceptEventTime) doubleValue];
}

- (void)setCs_acceptEventTime:(NSTimeInterval)cs_acceptEventTime {
    objc_setAssociatedObject(self, UIControl_acceptEventTime, @(cs_acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


+ (void)load {
    Method before   = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method after    = class_getInstanceMethod(self, @selector(cs_sendAction:to:forEvent:));
    method_exchangeImplementations(before, after);
}

- (void)cs_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([NSDate date].timeIntervalSince1970 - self.cs_acceptEventTime < self.yck_acceptEventInterval) {
        return;
    }
    
    if (self.yck_acceptEventInterval > 0) {
        self.cs_acceptEventTime = [NSDate date].timeIntervalSince1970;
    }
    
    [self cs_sendAction:action to:target forEvent:event];
}
@end
