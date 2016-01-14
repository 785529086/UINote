//
//  ViewController.m
//  UI08_NavigationController
//
//  Created by dllo on 15/12/22.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "SecendViewController.h"
@interface ViewController ()
@property (nonatomic, retain) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    /** 设置标题. */
//    self.title = @"首页";

    [self createButton];
    [self changeNavigationItem];
    
    
    
}
#pragma mark - UINavigationBar
- (void)changeBar {  

    /** 导航栏显隐设置. */
    self.navigationController.navigationBarHidden = NO;
    
    
    /** 导航栏样式. */
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    
    /** 导航栏背景颜色. */
    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    
    /** 导航栏上面item的颜色. */
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    

    
    
}

#pragma mark- UINavigationItem
- (void)changeNavigationItem {
    
    /** 中间的标题部分. */
//    self.navigationItem.title = @"首页";

    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"消息",@"通话"]];
    self.navigationItem.titleView = seg;
    
    /** 左边部分. */
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchAction:)];
    
    
    
    
    /** 右边部分. */
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"4"] style:UIBarButtonItemStylePlain target:self action:@selector(qqAction:)];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"收藏" style:UIBarButtonItemStylePlain target:self action:@selector(saveAction:)];
    self.navigationItem.rightBarButtonItems = @[item1, item2];


}
- (void)qqAction:(UIBarButtonItem *)barButton {


}


- (void)saveAction:(UIBarButtonItem *)barButton {


}
- (void)searchAction:(UIBarButtonItem *)barButton {
    
     NSLog(@"%s",__FUNCTION__);
}

/** 视图将要出现得时候.调用此方法.
 * 注意: 从第二页面返回到此页面时,也会调用此方法. */
- (void)viewWillAppear:(BOOL)animated {

   [self changeBar];
    



}

- (void)createButton {

    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(50, 80, self.view.frame.size.width - 100, 40);
    [self.view addSubview:self.button];
    
    [self.button setTitle:@"next" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    self.button.backgroundColor = [UIColor blueColor];
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)buttonAction:(UIButton *)button {

    /** 创建第二页VC对象. */
    SecendViewController *secend = [[SecendViewController alloc] init];
    
    /** Push(推出)第二页面. */
    [self.navigationController pushViewController:secend animated:YES];
    
    /** 内存管理. */
    [secend release];
    


}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
