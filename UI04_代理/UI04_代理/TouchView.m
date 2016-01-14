//
//  TouchView.m
//  UI04_代理
//
//  Created by dllo on 15/12/18.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
     [self.delegate changeBackFrime];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
   [self.delegate changeBackColor];

}



@end
