//
//  AppDelegate.m
//  UI16_TableBarController
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "VCForItem2.h"
#import "VCForItem3.h"
#import "VCForItem4.h"
#import "VCForItem5.h"
#import "VCForItem6.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@property (nonatomic, retain) UITabBarController *tb;

@end

@implementation AppDelegate


- (void)dealloc {
    
    [_window release];
    [_tb release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
    [self createTabBarController];
   

    [_window release];
    
   
    return YES;
}

#pragma mark - 知识点1 UITabBarController 
- (void)createTabBarController {

    /** 创建对象. */
    self.tb = [[UITabBarController alloc]init];
    
    /** 设置viewControllers属性. */
    [self createViewControllers];
    
    // 设置tabBar
    self.tb.tabBar.tintColor = [UIColor blackColor];
    self.tb.tabBar.barTintColor = [UIColor cyanColor];
    
    
    // delegate.
    self.tb.delegate = self;
    
    self.window.rootViewController = self.tb;
    [_tb release];
}

#pragma mark tabBarController Delegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {

    // 选中的VC在数组中的下标. 
    NSLog(@"%ld",tabBarController.selectedIndex);
    
    // 徽章清空.
    if (tabBarController.selectedIndex == 1) {
        viewController.tabBarItem.badgeValue = nil;
    }
}



- (void)createViewControllers {

    // item1
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
    [vc release];
    
    // 设置tabBarItem.
    navi.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemContacts tag:100];
    
    
    // item2
    VCForItem2 *item2 = [[VCForItem2 alloc]init];
    item2.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:200];
    
    // 设置徽章.
    item2.tabBarItem.badgeValue = @"99+";
    
    
    // item3, 自定义图片和标题.
    VCForItem3 *item3 = [[VCForItem3 alloc]init];
    item3.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemSearch tag:300];
    
    item3.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Phone" image:[[UIImage imageNamed:@"phone"] imageWithRenderingMode:UIImageRenderingModeAutomatic] tag:300];
    
    // item4, 自定义图片 + 选中之后的图片.
    VCForItem4 *item4 = [[VCForItem4 alloc]init];
    item4.tabBarItem  = [[UITabBarItem alloc]initWithTitle:@"hobby" image:[UIImage imageNamed:@"hobby"] selectedImage:[UIImage imageNamed:@"4"]];
    
    
    // item4.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:400];
    
    // item5
    VCForItem5 *item5 = [[VCForItem5 alloc]init];
    item5.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:500];
    
    // item6
    VCForItem6 *item6 = [[VCForItem6 alloc]init];
    item6.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:600];
    
    // 加入viewController数组中.
    self.tb.viewControllers = @[navi,item2,item3,item4,item5,item6];
    [navi release];
    [item2 release];
    [item3 release];
    [item4 release];
    [item5 release];
    [item6 release];
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
