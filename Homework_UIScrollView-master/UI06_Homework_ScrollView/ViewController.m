//
//  ViewController.m
//  UI06_Homework_ScrollView
//
//  Created by Scott on 15/12/23.
//  Copyright © 2015年 Scott. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"

@interface ViewController ()

@property (nonatomic, retain) UIScrollView *scroll;

@end

@implementation ViewController

- (void)dealloc {
    
    [_scroll release];
    [super dealloc];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createScroll];
}
#pragma mark - 背景ScrollView
- (void)createScroll {
    
    self.scroll = [[UIScrollView alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:self.scroll];
    [_scroll release];
    
    self.scroll.backgroundColor = [UIColor whiteColor];
    
    self.scroll.contentSize = CGSizeMake(300 * 10, self.view.frame.size.height);
    
    [self createCustomView];
}

#pragma mark - scroll上面的视图

- (void)createCustomView {
    
    for (int i = 0; i < 10; i++) {
        
        Cell *cell = [[Cell alloc] initWithFrame:CGRectMake(0, 100 * i, self.view.frame.size.width, 90)];
        
        [self.scroll addSubview:cell];
        [cell release];
        
        cell.backgroundColor = [UIColor orangeColor];
    }
}




#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
