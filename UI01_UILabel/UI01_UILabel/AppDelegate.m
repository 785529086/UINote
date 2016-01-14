//
//  AppDelegate.m
//  UI01_UILabel
//
//  Created by dllo on 15/12/11.
//  Copyright © 2015年 潘德文. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    //创建试图控制器
    UIViewController *VC = [[UIViewController alloc]init];
    //给window指定根视图控制器
    self.window.rootViewController = VC;
    
#pragma mark - 知识点1 UILabel
    //创建对象
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 80, 300, 50)];
    label.backgroundColor = [UIColor blackColor];
    [self.window addSubview:label];
    [label release];
    
    //核心API
    //设置标题
    label.text = @"用户名";
    //标题颜色
    label.textColor = [UIColor whiteColor];
    //标题字体
    label.font = [UIFont systemFontOfSize:25];
    //对齐方式
    label.textAlignment = NSTextAlignmentLeft;
    //显示行数
    label.numberOfLines = 0;
    //断行模式
    label.lineBreakMode = NSLineBreakByTruncatingMiddle;
    //tag
    label.tag = 100;
    //根据tag取出对象
    UILabel *findLabel = (UILabel *)[self.window viewWithTag:100];
    //阴影的设置
    label.shadowColor = [UIColor grayColor];
    label.shadowOffset = CGSizeMake(1, 3);
    
    [_window release];
    return YES;
}
-(void)dealloc{
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
