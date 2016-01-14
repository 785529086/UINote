//
//  LTView.m
//  UI03_UIViewController
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "LTView.h"

@implementation LTView

- (void)dealloc {
    
    [_labelOfLeft release];
    [_textFieldOfRight release];
    [super dealloc];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.labelOfLeft = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 3, frame.size.height)];
        self.textFieldOfRight = [[UITextField alloc] initWithFrame:CGRectMake(frame.size.width / 3, 0, frame.size.width * 2 / 3 , frame.size.height)];
        
        [self addSubview:self.textFieldOfRight];
        [self addSubview:self.labelOfLeft];
        
        [self.labelOfLeft release];
        [self.textFieldOfRight release];
        
        self.textFieldOfRight.borderStyle = 3;
    }
    return self;
}

@end
