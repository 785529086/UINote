//
//  ViewController.m
//  UI_轮播图
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "Photo.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createPhoto];
}

- (void)createPhoto {
    
    Photo *photo = [[Photo alloc] initWithFrame:CGRectMake(0, 0, 300, 400) images:@[@"1.jpg", @"2.jpg", @"3.jpg"]];
    
    photo.center = self.view.center;
    
    [self.view addSubview:photo];
    [photo release];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
