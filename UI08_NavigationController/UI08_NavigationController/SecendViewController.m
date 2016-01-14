//
//  SecendViewController.m
//  UI08_NavigationController
//
//  Created by dllo on 15/12/22.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "SecendViewController.h"
#import "ThirdViewController.h"
@interface SecendViewController ()

@property (nonatomic, retain) UIButton *buttonnext;

@end

@implementation SecendViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    /** 设置标题. */
    self.title = @"第二页";
    
    [self creatButtonNext];
    
}



- (void)creatButtonNext {

    self.buttonnext = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.buttonnext];
    self.buttonnext.frame = CGRectMake(50, 80, self.view.frame.size.width - 100, 40);
    
    [self.buttonnext setTitle:@"next" forState:UIControlStateNormal];
    [self.buttonnext setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    self.buttonnext.backgroundColor = [UIColor orangeColor];
    [self.buttonnext addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)buttonAction:(UIButton *)button {
    /** 创建第二页VC对象. */
    ThirdViewController *third = [[ThirdViewController alloc] init];
    
    /** Push(推出)第二页面. */
    [self.navigationController pushViewController:third animated:YES];
    
    /** 内存管理. */
    [third release];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
