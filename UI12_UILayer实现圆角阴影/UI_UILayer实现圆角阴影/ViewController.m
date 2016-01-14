//
//  ViewController.m
//  UI_UILayer实现圆角阴影
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (retain, nonatomic) IBOutlet UIButton *button;

@property (retain, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /* 圆角. */
    self.button.layer.cornerRadius = self.button.frame.size.width / 2;
//    self.button.layer.masksToBounds = YES;
    
    /* 边. */
    self.button.layer.borderWidth = 5.0f;
    self.button.layer.borderColor = [UIColor redColor].CGColor;
    
    /* 阴影. */
    self.button.layer.shadowOffset = CGSizeMake(10, 10);
    self.button.layer.shadowColor = [UIColor blackColor].CGColor;
    /** 阴影羽化效果. 及阴影清晰度. */
    self.button.layer.shadowRadius = 3;
    self.button.layer.shadowOpacity = 0.5;
//    self.button.layer.shadowPath
    
    
    // imageView 圆角.
    self.imageView.layer.cornerRadius = 40;
    self.imageView.layer.masksToBounds = YES;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_button release];
    [_imageView release];
    [super dealloc];
}
@end
