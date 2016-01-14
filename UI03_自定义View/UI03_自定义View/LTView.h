//
//  LTView.h
//  UI03_自定义View
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTView : UIView

/* 声明两个属性,分别表示两个子控件. */
@property (nonatomic, retain) UILabel *labelOfLeft;
@property (nonatomic, retain) UITextField *textFieldOfright;

@end
