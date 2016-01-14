//
//  ViewController.m
//  DrawingWithUIBezierPath
//
//  Created by Scott on 15/11/4.
//  Copyright © 2015年 Scott. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /* 创建DrawView对象 */
    DrawView *whiteView = [[DrawView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    whiteView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:whiteView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
