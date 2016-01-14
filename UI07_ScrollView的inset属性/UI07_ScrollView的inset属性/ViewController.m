//
//  ViewController.m
//  UI07_ScrollView的inset属性
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, retain) UIScrollView *scroll;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 防止scroll在有navigationController时上下左右跳动. 
    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    
    
    [self createScrollView];
    
    
}
- (void)createScrollView {

    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 300, 500)];
    scroll.center = self.view.center;
    [self.view addSubview:scroll];
    scroll.backgroundColor = [UIColor whiteColor];
    scroll.contentSize = CGSizeMake(600, 1000);

    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1.jpg"]];
    [scroll addSubview:imageView];
    [imageView release];
    
    
    // contentInset属性.
    scroll.contentInset = UIEdgeInsetsMake(50, 50, 0, 0);
    


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
