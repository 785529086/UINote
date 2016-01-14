//
//  ViewController.m
//  UI2_UITableView自定义Cell
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "CellOfContactTableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arr;

@end

@implementation ViewController


- (void)dealloc {

    [_tableView release];
    [_arr release];
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createTableView];
    [self handleData];
    
    
}

- (void)createTableView {

    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [_tableView release];
    
    
}

- (void)handleData {

    self.arr = @[@"zhangsan",@"lisi",@"wangwu"].mutableCopy;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arr.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 1) {
    /** 创建系统的Cell. */
    static NSString *poolName = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:poolName];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:poolName];
        [cell autorelease];
        
    }
        /** Cell 的赋值. */
        cell.textLabel.text = @"这是系统的Cell. ";
        return cell;
        
    }else{
    /** 获取自定义Cell.
     *
     *  详见CellOfContactTableView. */
        static NSString *pool2 = @"reuse2";
        CellOfContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:pool2];
        if (cell == nil) {
            cell = [[CellOfContactTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:pool2];
            [cell autorelease];
        }
        
        
        return cell;
    
    

    }

}


#pragma mark - TableView Delegate
/** 返回每行的高度. */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
