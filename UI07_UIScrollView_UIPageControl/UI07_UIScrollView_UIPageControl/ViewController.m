//
//  ViewController.m
//  UI07_UIScrollView_UIPageControl
//
//  Created by dllo on 15/12/21.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "Picture.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createPicView];
    
}

#pragma mark - 知识点1 UIScrollView_UIPageController
/** 详见Picture类. */
- (void)createPicView {
    
    Picture *pic = [[Picture alloc]initWithFrame:CGRectMake(0, 0, 300, 400) images:@[@"QQ.jpg",@"2",@"3"]];
    [self.view addSubview:pic];
    pic.center = self.view.center;
    [pic release];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
