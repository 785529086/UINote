//
//  ViewController.m
//  UI14_UILayer实现圆角_阴影
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (retain, nonatomic) IBOutlet UIButton *Button;
@property (retain, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (IBAction)button:(id)sender {
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /** 圆角. */
    
    self.Button.layer.cornerRadius = 20;
    self.Button.layer.masksToBounds = YES;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_Button release];
    [_button release];
    [super dealloc];
}
@end
