//
//  ViewController.m
//  UI13_UITableViewCell自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "ModelOfNews.h"
#import "CellOfNew.h"
#import "SecendViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arrOfmodel;

@end



@implementation ViewController


- (void)dealloc{

    [_tableView release];
    [_arrOfmodel release];
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createTableView];
    
    [self handleData];

}

- (void)handleData {
    
    self.arrOfmodel = [NSMutableArray array];

    NSString *path = [[NSBundle mainBundle]pathForResource:@"news" ofType:@"txt"];

    /** 创建一个数据对象. */
    NSData *data = [NSData dataWithContentsOfFile:path];
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

    
    /** 取出数组. */
    NSArray *arr = [result objectForKey:@"news"];
    
    /** 遍历数组,将数组中的字典转换为model. */
    for (NSDictionary *dic in arr) {
        
        ModelOfNews *model = [[ModelOfNews alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        
        [self.arrOfmodel addObject:model];
        [model release];
    }
}


- (void)createTableView {

    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [_tableView release];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[CellOfNew class] forCellReuseIdentifier:@"pool1"];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrOfmodel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /** 创建一个cell. */
    CellOfNew *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
    
    /** 给cell赋值. */
    ModelOfNews *model = [self.arrOfmodel objectAtIndex:indexPath.row];
    [cell passModel:model];

    /** 返回一个cell. */
    
    return cell;
}

#pragma mark 
/** 返回每行的高度. */

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /** 从数组中获取字符串. */
    ModelOfNews *model = [self.arrOfmodel objectAtIndex:indexPath.row];
    NSLog(@"%f",[CellOfNew heightForCell:model]);
    
    /** 通过cell的计算高度方法,返回高度值. */
  return [CellOfNew heightForCell:model];

}

/** 点击cell之后调用此方法. */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    SecendViewController *secend = [[SecendViewController alloc]init];
    [self.navigationController pushViewController:secend animated:YES];
    [secend release];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
