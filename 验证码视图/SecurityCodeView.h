//
//  SecurityCodeView.h
//  验证码视图
//
//  Created by huhang on 15/11/11.
//  Copyright (c) 2015年 huhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^securityCode) (NSString *);

@interface SecurityCodeView : UIView

@property (nonatomic,copy)securityCode codeStr;

@end
