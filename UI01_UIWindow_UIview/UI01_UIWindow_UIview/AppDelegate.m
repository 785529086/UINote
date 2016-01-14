//
//  AppDelegate.m
//  UI01_UIWindow_UIview
//
//  Created by dllo on 15/12/14.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - 知识点1 UIWindow
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /* 当程序对象加载完成(在内存中开辟空间)后,调用此协议方法. */
    
    /* 在此协议方法中,通常创建UIWindow对象,UIViewContrller对象,其它控件对象.*/
    
    /* 创建UIWindow对象,及相关设置.
     和主屏幕([UIScreen mainScreen])等大*/
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    /* 背景颜色,注意颜色是一个对象(UIColor)*/
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    /* window设置为主window并可见*/
    [self.window makeKeyAndVisible];
    
    /* 创建一个viewController对象. */
    UIViewController *vc = [[UIViewController alloc] init];
    
    /* 将VC设置为window根视图控制器. */
    self.window.rootViewController = vc;
    
#pragma mark - 知识点3 UIView
    /**
     *当接触到一个新类时,首先看是否有自己的初始化方法(构造器方法),如果没有自己特有的初始化方法,找父类的初始化方法,依次类推.
     */
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view1.backgroundColor = [UIColor redColor];
    
    /* 查看一下 window 的子视图. */
    NSLog(@"%@",self.window.subviews);
    
    /* 练习 创建UIView对象：
     设置frame x = 100，y = 200 ，w = 100 ，h = 100
     设置背景色为蓝色
     添加到window上
     把view放到屏幕中心位置
     设置透明度50%
     打印它的父视图
     打印它的子视图
     通过tag值把背景色改为红色
     */
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    view2.backgroundColor = [UIColor greenColor];
    [self.window addSubview:view2];
    
    /* 中心点属性. */
    view2.center = self.window.center;
    
    /* 透明度 */
    view2.alpha = 0.5f;
    
    /* 父视图 */
    NSLog(@"super:%@",view2.superview);
    
    /* 子视图 */
    NSLog(@"subviews:%@",view2);
    
    /* tag 是UIView 的一个属性,做个标记, 目的:可以通过tag 找到此对象. */
    
    
    
    view2.tag = 100;
    
    /* 根据标签,找到控件对象. */
   UIView *findView = [self.window viewWithTag:100];
    findView.backgroundColor = [UIColor blackColor];
    
    
    /* 练习要求：新建一个工程，创建5个视图(aView、bView、cView、dView、eView)
     1、window用addSubview:方法先后添加aView和bView。
     2、window用insertSubview:atIndex:方法把cView添加到aView和bView之间。
     3、window用insertSubview:aboveSubview:方法把dView添加到aView的上面。
     4、window用insertSubview:belowSubview:方法把eView添加到bView的下面。*/
    
    
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(100, 400, 100, 100)];
    aView.backgroundColor = [UIColor redColor];
    aView.tag = 1000;
    [self.window addSubview:aView];
    [aView release];
    
    
    UIView *bView = [[UIView alloc]initWithFrame:CGRectMake(120, 420, 100, 100)];
    bView.tag = 2000;
    bView.backgroundColor = [UIColor yellowColor];
    [self.window addSubview:bView];
    [bView release];
    
    
    UIView *cView = [[UIView alloc]initWithFrame:CGRectMake(140, 440, 100, 100)];
    cView.tag = 3000;
    cView.backgroundColor = [UIColor blackColor];
    [self.window insertSubview:cView atIndex:4];
    [cView release];
    
    
    
    
    UIView *dView = [[UIView alloc] initWithFrame:CGRectMake(160, 460, 100, 100)];
    dView.tag = 4000;
    dView.backgroundColor = [ UIColor greenColor];
    [self.window insertSubview:dView aboveSubview:aView];
    [dView release];
    
    
    
    UIView *eView = [[UIView alloc] initWithFrame:CGRectMake(180, 480, 100, 100)];
    eView.tag = 5000;
    eView.backgroundColor = [UIColor blueColor];
    [self.window insertSubview:eView belowSubview:bView];
    [eView release];
    
    
    
    
#pragma mark - 知识点4 UIButton(了解)
    /* 1. 创建button对象 */
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(210, 100, 60, 40);
    button.backgroundColor = [UIColor orangeColor];
    [self.window addSubview:button];
    
    /* 设置Button上面的标题. */
    [button setTitle:@"点击" forState:UIControlStateNormal];
    
    /* button添加点击事件.
     *self 指Appdelegate对象
     *@selector,appdelegate的方法.
     *控制事件,选择touchupinside. 
     */
    [button addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    
    /* 练习要求：创建一个Button，在点击方法里面，调整练习3的视图层级：
     1、window把aView移动到最前面。
     2、window把bView移动到最后面。
     3、window交换dView和eView。
     4、把cView从父视图上移除。*/
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(50, 600, 50, 50);
    button1.backgroundColor = [UIColor redColor];
    [self.window addSubview:button1];
    [button1 setTitle:@"求点" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(firstaView:) forControlEvents:UIControlEventTouchUpInside];
    
    
    /* 添加到window上. */
    [self.window addSubview:view1];
    
    /* 内存管理. */
    [view1 release];
    
    
    
    
    
    
    
#pragma mark - 知识点2 MRC 下的内存管理.
    
    [vc release];
    [_window release];
  
    return YES;
}
#pragma mark - button 点击事件
- (void)handleAction:(UIButton *)button {
    NSLog(@"点击!");
}



- (void)firstaView:(UIButton *)button {
    UIView *aView = [self.window viewWithTag:1000];
    [self.window bringSubviewToFront:aView];
    
    UIView *bView = [self.window viewWithTag:2000];
    [self.window sendSubviewToBack:bView];
    
    UIView *cView = [self .window viewWithTag:3000];
    UIView *dView = [self.window viewWithTag:4000];
    UIView *eView = [self.window viewWithTag:5000];
    [cView removeFromSuperview];
    [self.window exchangeSubviewAtIndex:4 withSubviewAtIndex:6];
    
}
#pragma mark - 重写delloc方法


- (void)dealloc {
    [_window release];
    [super dealloc];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
