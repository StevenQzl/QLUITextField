//
//  ViewController.m
//  TextFileTest
//
//  Created by 屈亮 on 2020/3/15.
//  Copyright © 2020 屈亮. All rights reserved.
//

#import "ViewController.h"
#import "QLTextField.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    QLTextField *text = [[QLTextField alloc] initWithFrame:CGRectMake(40, 100, self.view.bounds.size.width - 200, 40)];
    text.placeholder = @"请输入内容";
    text.tag = 1080;
    [self.view addSubview:text];
    
    // 创建一个button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 200, 100, 30);
    [button setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
}

- (void)showAlert
{
    QLTextField *textField = [self.view viewWithTag:1080];
    [textField showAlertView];
}
@end
