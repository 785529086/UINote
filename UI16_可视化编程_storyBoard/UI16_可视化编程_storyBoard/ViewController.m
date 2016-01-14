//
//  ViewController.m
//  UI16_可视化编程_storyBoard
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "SecendViewController.h"

@interface ViewController ()
@property (retain, nonatomic) IBOutlet UIButton *handleNext;

@end

@implementation ViewController
- (IBAction)handleNext:(id)sender {
    // 跳转下一页. 
//    SecendViewController *secend = [[SecendViewController alloc]initWithNibName:@"SecendViewController" bundle:[NSBundle mainBundle]];

    

    // 当VC的xib文件名和VC类的名字一样时,初始化方法可以使用init,系统会首先去找和VC类名相同的xib文件.
    SecendViewController *secend  = [[SecendViewController alloc]init];
    
    [self.navigationController pushViewController:secend animated:YES];
    
    [secend release];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_handleNext release];
    [super dealloc];
}
@end
