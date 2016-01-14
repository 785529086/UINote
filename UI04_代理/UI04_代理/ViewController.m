//
//  ViewController.m
//  UI04_代理
//
//  Created by dllo on 15/12/18.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "TouchView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TouchView *touchView = [[TouchView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    touchView.tag = 100;
    [self.view addSubview:touchView];
    touchView.backgroundColor = [UIColor redColor];
    [touchView release];
    
    touchView.delegate = self;
   
//    touchView.delegate = self;
    
}

- (void)changeBackColor {
    
    
    self.view.backgroundColor = [UIColor blackColor];

}

- (void)changeBackFrime {

    [self.view viewWithTag:100].frame = CGRectMake(10, 10, 10, 10);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
