//
//  ViewController.m
//  UI_NextResponder
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "ScrollForCustom.h"
@interface ViewController ()

@property (nonatomic, retain) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createButton];
}

- (void)createButton {


    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.button];
    
    self.button.frame = CGRectMake(0, 0, 200, 50);
    
    self.button.center = self.view.center;
    
    self.button.backgroundColor = [UIColor redColor];
    
    [self.button setTitle:@"next" forState:UIControlStateNormal];
    
    [self.button addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    
    // scrollView
    ScrollForCustom *scroll = [[ScrollForCustom alloc]initWithFrame:CGRectMake(0, 0, 150, 200)];
    
    scroll.backgroundColor = [UIColor whiteColor];
       scroll.center = self.button.center;
        [self.button addSubview:scroll];
 

    
    

}

#warning button事件不一致.
- (void)backAction:(UIButton *)button {

    [button becomeFirstResponder];

    NSLog(@"dd");



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
