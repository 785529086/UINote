//
//  ViewController.m
//  UI16_TableBarController
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "VCForItem2.h"

@interface ViewController ()

@property (nonatomic, retain) UIButton *button;

@end

@implementation ViewController

- (void)dealloc {

    [_button release];
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createButton];
}

- (void)createButton {


    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.button];
    self.button.frame = CGRectMake(0, 0, 50, 50);
    self.button.center = self.view.center;
    self.button.backgroundColor = [UIColor redColor];
    [self.button setTitle:@"next" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    

}

- (void)backAction:(UIButton *)button {

    // 跳转下一页面.
    self.tabBarController.selectedIndex = 3;




}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
