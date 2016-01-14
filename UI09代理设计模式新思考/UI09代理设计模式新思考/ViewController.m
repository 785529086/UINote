//
//  ViewController.m
//  UI09代理设计模式新思考
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "TouchView.h"


@interface ViewController () <TouchViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createTouchView];
    
    
    
}

- (void)createTouchView {

    TouchView *view = [[TouchView alloc] initWithFrame:CGRectMake(50, 80, self.view.frame.size.width - 100, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    [view release];
    
    view.delegate = self;
    


}


- (void)beginClick {


    NSLog(@"我知道了");


}


- (void)didClick {

    NSLog(@"噢");

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
