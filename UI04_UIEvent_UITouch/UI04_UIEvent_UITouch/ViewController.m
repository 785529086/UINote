//
//  ViewController.m
//  UI04_UIEvent_UITouch
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"

#import "TouchView.h"
#import "Move.h"

#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
#define WHITE [UIColor whiteColor]


@interface ViewController ()<TouchViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = WHITE;
    [self touchEvent];
    [self moveView];
    
}


#pragma mark - 知识点1 事件(UIEvent)

/**
 *UIEvent有三种事件:触摸(UITouch), 摇晃,远程控制. 
 *
 *本节重点是 触摸事件(touch).
 */
#pragma mark - 知识点2 触摸

- (void)touchEvent {

    /**
     * 触摸就是硬件能感应到 手指 触摸屏幕. 
     * 重点是: 触摸之后的操作.(重写Touch相关的方法(开始触摸,触摸移动,触摸结束))
     * */
    
    
    /** 创建一个自定义View(TouchView) */

    TouchView *viewTouch = [[TouchView alloc] initWithFrame:CGRectMake(50, 50, WIDTH - 100, 50)];
    
    viewTouch.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:viewTouch];
    [viewTouch release];
    
    
    viewTouch.delegate = self;
}


- (void)changeBackColor {
    self.view.backgroundColor = [UIColor grayColor];


}

#pragma mark - 点击空白区域,回收键盘.

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    NSLog(@"controller 响应开始触摸");
}




#pragma mark - 知识点3 控件随着手指移动
- (void)moveView {
    
    Move *viewMove = [[Move alloc] initWithFrame:CGRectMake(100, 120, 50, 50)];
    viewMove.backgroundColor = [UIColor blackColor];
    [self.view addSubview:viewMove];
    viewMove.tag = 100;
    
    [viewMove release];


}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"vccontroller响应移动");
    /** 从参数toucches里面获取UITouch对象(手指). */
    UITouch *t = [touches anyObject];
    
    /** 获取Touch对象在View上的坐标. */
    CGPoint pint =[t locationInView:self.view];
    pint.y = 500;
    NSLog(@"%f,%f",pint.x, pint.y);
    
    /** 使moveView的中心点和手指的坐标点一样. */
    
    if (t.view == [self.view viewWithTag:100]) {
//        self.view.center = pint;
        [self.view viewWithTag:100].center = pint;
    }
    
}

#pragma mark - 知识点4 响应者链
/** 
 * UIResponder 类(响应者类)
 *
 * UIResponder 是个抽象类(不能用抽象类直接创建对象). 用它的子类创建对象.
 *
 * UIView UIViewController UIApplication等都是它的子类.
 *
 * 响应者链就是由UIResponder子类对象组成的图层关系.
 *
 *
 */



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
