//
//  ViewController.m
//  验证码视图
//
//  Created by huhang on 15/11/11.
//  Copyright (c) 2015年 huhang. All rights reserved.
//

#import "ViewController.h"
#import "SecurityCodeView.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    SecurityCodeView *securityCode = [[SecurityCodeView alloc]initWithFrame:CGRectMake(0, 100, kScreenWidth, 40)];
    securityCode.codeStr = ^(NSString *string){
        NSLog(@"== %@",string);
    };
    [self.view addSubview:securityCode];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
