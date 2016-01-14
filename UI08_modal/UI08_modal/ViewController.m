//
//  ViewController.m
//  UI08_modal
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "SecendViewController.h"
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
    self.navigationItem.title = @"登陆界面";
    [self createButton];
    
}

- (void)createButton {


    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(50, 80, self.view.frame.size.width - 100, 40);
    [self.button setTitle:@"next" forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    self.button.backgroundColor = [UIColor yellowColor];
    
    [self.button addTarget:self action:@selector(buttonAction:)   forControlEvents:UIControlEventTouchUpInside];


}
#pragma mark - 知识点1 :模态推出ViewController(页面)
- (void)buttonAction:(UIButton *)button{

    /** 创建新的页面对象. */
    
    SecendViewController *secend = [[SecendViewController alloc] init];
        
    /** 模态推出新界面. 模态是ViewController方法. */
    secend.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:secend animated:YES completion:^{
        
    }];
    [secend release];
    
    
    





}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
