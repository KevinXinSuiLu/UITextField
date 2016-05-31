//
//  SecurityCodeView.m
//  验证码视图
//
//  Created by huhang on 15/11/11.
//  Copyright (c) 2015年 huhang. All rights reserved.
//

#import "SecurityCodeView.h"

@interface SecurityCodeView()<UITextFieldDelegate>

@property (nonatomic,strong)NSMutableArray *labelArrays;

@end

@implementation SecurityCodeView
//初始化方法
- (instancetype)initWithFrame:(CGRect)frame{
 
    if (self = [super initWithFrame:frame]) {
        _labelArrays = [NSMutableArray array];
        [self setupView];
    }
    return self;
}

- (void)setupView{

    //创建一个输入框
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    textField.backgroundColor = [UIColor clearColor];
    textField.tintColor = [UIColor clearColor];
    textField.textColor = [UIColor clearColor];
    textField.keyboardType = UIKeyboardTypePhonePad;
    textField.delegate = self;
    [self addSubview:textField];
   
    //循环创建6个label
    for (int i = 0; i < 6; i++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(25 + i * ((CGRectGetWidth(self.frame) - 40) / 6), 0, (CGRectGetWidth(self.frame) - 40) / 6 - 10, 40)];
        label.layer.borderWidth = 1;
        label.layer.borderColor = [UIColor blackColor].CGColor;
        label.textColor = [UIColor blueColor];
        label.font = [UIFont boldSystemFontOfSize:25.0];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        [_labelArrays addObject:label];
    }
    
    //把输入框放到最label上面
    [self bringSubviewToFront:textField];
}

//输入完成时会执行这个方法
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    //拼接字符串
    NSString *currentStr = [NSString stringWithFormat:@"%@%@",textField.text,string];
    //当数字大于6个时返回no
    if (currentStr.length > _labelArrays.count) return NO;
    
    //给label赋值
    UILabel *label = _labelArrays[currentStr.length - 1];
    label.text = string;
    
    if (currentStr.length == _labelArrays.count) {
        self.codeStr(currentStr);
    }
    
    return YES;
}

@end