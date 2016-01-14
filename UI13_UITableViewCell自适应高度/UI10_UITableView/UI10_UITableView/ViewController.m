//
//  ViewController.m
//  UI10_UITableView
//
//  Created by dllo on 15/12/24.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, retain) UITableView *tableView;

/** 声明一个数组属性,存放数据. */
@property (nonatomic, retain) NSMutableArray *arrData;


@end

@implementation ViewController

- (void)dealloc {
    [_tableView release];
    [super dealloc];


}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    [self createTableView];
    [self handleData];
}
#pragma mark - 知识点1: UITableView

- (void)createTableView {


    /** 创建对象.
     * 参数2 :指定风格,有两个风格, (普通,分组). */
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.tableView];
    [_tableView release];
    
    /** tableView 的一些API. */
    /** 全局cell的高度(对所有cell起作用).*/
    self.tableView.rowHeight = 100;
    
    /** 分割线样式. */
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    /** 分割线颜色. */
    self.tableView.separatorColor = [UIColor redColor];
    
    
    
    
    /** 重点: tableView 大部分的功能是通过Delegate设计模式实现的,即代理人通知tableView如何做....*/
    self.tableView.dataSource = self;

    self.tableView.delegate = self;
}

#pragma mark - TableView DataSource





/** 必须实现的协议方法(1/2)(共2个必须实现). */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arrData.count;

}

#pragma mark - 知识点2 UITableViewCell重用池机制.
/** 必须实现的协议方法(2/2)*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"%ld, %ld",indexPath.section,indexPath.row);

//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
//    return cell;
    
    /** static 修饰变量,只初始化一次, 在静态区开辟空间,程序结束,内存才释放. */
   static NSString *poolName = @"reuse";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:poolName];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:poolName]autorelease];
    }
    
    /** cell进行赋值. 
     * 系统封装好的Cell只有三个控件可以赋值(textLabel  detailtextlabel, imageView). 可以自定义Cell. 
     * 系统的Cell所谓的4种风格(style),实际上就是上面的3个控件的不同组合. */
//    cell.textLabel.text = [self.arrData objectAtIndex:indexPath.row];
    
//    cell.detailTextLabel.text = @"kate";/*无显示,默认风格. */
//    
//    cell.imageView.image = [UIImage imageNamed:@"2"];
    
    
    /** 取出数组中相应的字典. */
    NSDictionary *dic = [self.arrData objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [dic objectForKey:@"title"];
    cell.detailTextLabel.text = [dic objectForKey:@"detail"];
    cell.imageView.image = [UIImage imageNamed:[dic objectForKey:@"image"]];

    /** cell 最后边的的辅助区域. */
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    /** 返回cell. */
    return cell;
}


#pragma mark - table Delegate 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"ddd");
    NSLog(@"%ld,%ld",indexPath.section,indexPath.row);
}

- (void)handleData {

    /** 数组中都是字符串对象. */
//    self.arrData = @[@"娜美",@"罗宾",@"香吉士",@"索隆",@"汉库克",@"布鲁克",@"佩罗娜",@"香阁斯",@"艾斯",@"小丑巴基",@"桔梗",@"莫利亚",@"乔巴",@"弗兰克"].mutableCopy;

    /** 数组中都是字典对象. */
    self.arrData = @[
                     @{@"title":@"zhang",
                       @"detial":@"aaa",
                       @"image":@"2"},
                     
                     @{@"title":@"zhang1",
                       @"detial":@"aaa1",
                       @"image":@"5"},
                     
                     @{@"title":@"zhang",
                       @"detial":@"aaa",
                       @"image":@"4"},
                     
                     @{@"title":@"zhang2",
                       @"detial":@"aaa2",
                       @"image":@"2"},
                     
                     @{@"title":@"zhang2",
                       @"detial":@"aaa3",
                       @"image":@"5"}].mutableCopy;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
