//
//  SecendViewController.m
//  UI09_
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "SecendViewController.h"

@interface SecendViewController ()
@property (nonatomic, retain) UILabel *label;

@end

@implementation SecendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    [self createLabel];
    
    
    
}

- (void)createLabel {

    self.label = [[UILabel alloc]initWithFrame:CGRectMake(50, 80, self.view.frame.size.width - 100, 40)];
    self.label.backgroundColor = [UIColor lightGrayColor];
    
    self.label.text = self.strReceive;
    
    [self.view addSubview:self.label];
    [_label release];


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
