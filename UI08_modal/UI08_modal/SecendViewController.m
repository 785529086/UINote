//
//  SecendViewController.m
//  UI08_modal
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "SecendViewController.h"
#import "ViewController.h"
@interface SecendViewController ()
@property (nonatomic, retain) UIButton *backButton;
@end

@implementation SecendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createBackButton];
    self.navigationItem.title = @"第二界面";
    self.view.backgroundColor = [UIColor redColor];
 
    
    
}

- (void)createBackButton {
    
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.backButton.frame = CGRectMake(50, 80, self.view.frame.size.width - 100, 40);
    [self.backButton setTitle:@"back" forState:UIControlStateNormal];
    [self.view addSubview:self.backButton];
    self.backButton.backgroundColor = [UIColor yellowColor];
    
    [self.backButton addTarget:self action:@selector(backAction:)   forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark - 通过模态推出来得页面,如何返回
- (void)backAction:(UIButton *)button {
    
    NSLog(@"%@",self.navigationController.viewControllers);

    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    

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
