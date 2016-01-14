
//
//  DrawView.m
//  DrawingWithUIBezierPath
//
//  Created by Scott on 15/11/4.
//  Copyright © 2015年 Scott. All rights reserved.
//

#import "DrawView.h"

@interface DrawView ()

@property (nonatomic, strong) UIBezierPath *path; /**< 声明一个曲线属性 */

@end

@implementation DrawView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        /* 初始化 */
        self.path = [UIBezierPath bezierPath];
    }
    return self;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    UITouch *touch = [touches anyObject];
    
    /* 设置画笔的宽度*/
    self.path.lineWidth = 5.0f;
    
    /* 贝塞尔曲线的初始点 */
    [self.path moveToPoint:[touch locationInView:self]];
    
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    /* 将当前的坐标点添加到贝塞尔曲线中 */
    [self.path addLineToPoint:[touch locationInView:self]];
    
    /* 系统自动调用drawRect:方法 */
    [self setNeedsDisplay];

}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    [self.path addLineToPoint:[touch locationInView:self]];
    
    [self setNeedsDisplay];
}


- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
       /* 执行父类方法 */
       [super touchesCancelled:touches withEvent:event];
    
}


- (void)drawRect:(CGRect)rect {
    
    
    /* 画笔的颜色 */
    [[UIColor redColor] setStroke];
    
    /* 贝塞尔曲线绘画 */
    [self.path stroke];

}

@end
