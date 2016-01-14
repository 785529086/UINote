//
//  SecendViewController.m
//  UI13_UITableViewCell自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "SecendViewController.h"
#import "CellForImageTableViewCell.h"

@interface SecendViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSArray *arr;
@end

@implementation SecendViewController

- (void)dealloc {

    [_arr release];
    [_tableView release];
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self handleData];
    [self createTableView];
}

- (void)createTableView {

    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [_tableView release];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    [self.tableView registerClass:[CellForImageTableViewCell class] forCellReuseIdentifier:@"pool3"];
 
}


- (void)handleData {


    self.arr = @[@"7.jpg",@"8.jpg",@"9.jpg",@"10.jpg"];


}




#pragma mark - tableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CellForImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool3"];
    
    cell.imageViewForPic .image = [UIImage imageNamed:[self.arr objectAtIndex:indexPath.row]];

    NSLog(@"cell,%@",cell);
    return cell;
    
}

#pragma mark - tableView Delegate

    /** 返回每行的高度. */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    /** 从数组中取出字符串. */
    NSString *name = [self.arr objectAtIndex:indexPath.row];
    
    /** 调用cell的方法, 计算高度. */

    return [[CellForImageTableViewCell class] heightForCellWithName:name];

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
