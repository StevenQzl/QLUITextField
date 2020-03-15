//
//  QLTextField.m
//  TextFileTest
//
//  Created by 屈亮 on 2020/3/15.
//  Copyright © 2020 屈亮. All rights reserved.
//

#import "QLTextField.h"
@interface QLTextField ()
@property (nonatomic,strong)CAShapeLayer *alertLayer;
@end
@implementation QLTextField

- (void)creatLayer
{
    if (self.alertLayer) {
        [self.alertLayer removeFromSuperlayer];
    }
    self.alertLayer = [CAShapeLayer layer];
    self.alertLayer.frame = self.bounds;
    self.alertLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:0].CGPath;
    self.alertLayer.lineWidth = 1;
    [[UIScreen mainScreen] scale];
    self.alertLayer.lineDashPattern = nil;
    self.alertLayer.fillColor = [UIColor clearColor].CGColor;
    self.alertLayer.strokeColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:self.alertLayer];
}


- (void)showAlertView
{
    [self creatLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"opacity";
    animation.fromValue = @1;
    animation.toValue = @0;
    animation.repeatCount = 2;
    animation.repeatDuration = 2;
    animation.autoreverses = YES;
    [self.alertLayer addAnimation:animation forKey:nil];
    
    // 2秒后移除动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 2秒后异步执行这里的代码...
        // 移除动画
        [self.alertLayer removeFromSuperlayer];
    });
}
@end
