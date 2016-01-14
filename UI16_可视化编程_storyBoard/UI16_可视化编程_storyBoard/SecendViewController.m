//
//  SecendViewController.m
//  UI16_可视化编程_storyBoard
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "SecendViewController.h"
#import "ThirdViewController.h"

@interface SecendViewController ()

@property (retain, nonatomic)
    IBOutlet UIButton *handleNext;

@end

@implementation SecendViewController

- (IBAction)handleNext:(id)sender {
    
    ThirdViewController *third = [[ThirdViewController alloc]init];
    [self.navigationController pushViewController:third animated:YES];
    [third release];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (void)dealloc {
    [_handleNext release];
    [super dealloc];
}
@end
