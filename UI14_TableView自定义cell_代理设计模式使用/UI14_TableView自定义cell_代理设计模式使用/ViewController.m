//
//  ViewController.m
//  UI14_TableView自定义cell_代理设计模式使用
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "CellForCustomTableViewCell.h"
#import "SecendViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,CellForCustomDelegate>


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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(handleNext:)];

//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem alloc]ini
    
    
}

- (void)handleNext:(UIBarButtonItem *)barBtn{
    
    SecendViewController *secend = [[SecendViewController alloc]init];
    [self.navigationController pushViewController:secend animated:YES];
    [secend release];


}


- (void)handleData {

    self.arr = @[@"zhang",@"wang",@"wu",@"li",@"zhou",@"liu"].mutableCopy;

}


- (void)createTableView {

    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [_tableView release];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[CellForCustomTableViewCell class] forCellReuseIdentifier:@"pool"];
    
    
}
#pragma mark - tableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CellForCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];
    
    cell.delegate = self;
    
    cell.labelForTitle.text = [self.arr objectAtIndex:indexPath.row];
    
    return cell;
    
}



#pragma mark - tableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 100;
}

#pragma mark - CellForCustom delegate 

/** 删除cell. */
- (void)handleDeleAction:(CellForCustomTableViewCell *)cell {

    /** 先获取要删除cell的下标. */
    NSIndexPath *indexpath = [self.tableView indexPathForCell:cell];
    NSLog(@"%ld,%ld",indexpath.section, indexpath.row);
    
    /* 删除数据. */
    [self.arr removeObjectAtIndex:indexpath.row];
    /** 删除tableView上得cell. */
    [self.tableView deleteRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationRight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"点击无用, 因为上边还覆盖着一个图层scrollView");
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
