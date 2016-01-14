//
//  ScrollForCell.m
//  UI14_TableView自定义cell_代理设计模式使用
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "ScrollForCell.h"

@implementation ScrollForCell


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
 
    NSLog(@"%@",self.nextResponder.nextResponder.nextResponder.nextResponder);
    
    [self.nextResponder.nextResponder.nextResponder.nextResponder touchesBegan:touches withEvent:event];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self.nextResponder.nextResponder.nextResponder.nextResponder touchesEnded:touches withEvent:event];

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
