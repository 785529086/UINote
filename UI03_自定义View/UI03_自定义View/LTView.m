//
//  LTView.m
//  UI03_自定义View
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "LTView.h"

@implementation LTView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


/** 因为LTView类在外部使用时,使用父类initWithFrame:方法初始化,因此重写这个方法,
 目的:创建两个子控件. */

- (void)dealloc {

    [_labelOfLeft release];
    [_textFieldOfright release];
    [super dealloc];

}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
 if(self)
 {
     /*创建子视图.*/
     self.labelOfLeft = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width / 3, frame.size.height)];
     self.textFieldOfright = [[UITextField alloc] initWithFrame:CGRectMake(frame.size.width / 3,0 , frame.size.width * 2 / 3 , frame.size.height)];
     
     
     [self addSubview:self.labelOfLeft];
     [self addSubview:self.textFieldOfright];
     
     self.labelOfLeft.backgroundColor = [UIColor whiteColor];
     self.textFieldOfright.backgroundColor = [UIColor whiteColor];
     
     [self.labelOfLeft release];
     [self.textFieldOfright release];
     

     self.textFieldOfright.borderStyle = UITextBorderStyleRoundedRect;
     
 }
    return self;

}

@end
