//
//  ThirdViewController.m
//  UI08_NavigationController
//
//  Created by dllo on 15/12/22.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()


@property (nonatomic, retain) UIButton *buttonBack;
@property (nonatomic, retain) UIButton *buttonToRoot;


@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"第三页";
    [self creatButtonBack];
    [self createButtonToRoot];
    
    
}

- (void)creatButtonBack {
    
    self.buttonBack = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.buttonBack];
    self.buttonBack.frame = CGRectMake(50, 80, self.view.frame.size.width - 100, 40);
    
    [self.buttonBack setTitle:@"Back" forState:UIControlStateNormal];
    [self.buttonBack setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    self.buttonBack.backgroundColor = [UIColor orangeColor];
    [self.buttonBack addTarget:self action:@selector(buttonBackAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

/** 返回上一页. */
- (void)buttonBackAction:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)createButtonToRoot {

    
    self.buttonToRoot = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.buttonToRoot];
    self.buttonToRoot.frame = CGRectMake(50, 150, self.view.frame.size.width - 100, 40);
    
    [self.buttonToRoot setTitle:@"ToRoot" forState:UIControlStateNormal];
    [self.buttonToRoot setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    self.buttonToRoot.backgroundColor = [UIColor orangeColor];
    [self.buttonToRoot addTarget:self action:@selector(buttonToRootAction:) forControlEvents:UIControlEventTouchUpInside];

}

/** 返回首页. */
- (void)buttonToRootAction:(UIButton *)button {
    
    
    /** 方法1. */
//    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
    /** 方法2. */
    [self.navigationController popToViewController:[self.navigationController.viewControllers firstObject] animated:YES];
    

//    [self.navigationController popToViewController:first animated:YES];




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
