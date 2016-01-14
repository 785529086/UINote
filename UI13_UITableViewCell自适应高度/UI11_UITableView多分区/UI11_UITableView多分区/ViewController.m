//
//  ViewController.m
//  UI11_UITableView多分区
//
//  Created by dllo on 15/12/25.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;

@property (nonatomic, retain) NSMutableDictionary *dicContact;

@property (nonatomic, retain) NSMutableArray *arrKey;
@end

@implementation ViewController


- (void)dealloc {
    
    [_dicContact release];
    [_tableView release];
    [_arrKey release];
    [super dealloc];


}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createTableView];
//    [self handleData];
    [self handleDataFromPlist];

}

#pragma mark - tableView

- (void)createTableView {

    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;


}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *poolName = @"reuse";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:poolName];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:poolName]autorelease];
        
        /** cell的赋值. */
    
        NSString *key = [self.arrKey objectAtIndex:indexPath.section];
        
        NSArray *arr = [self.dicContact objectForKey:key];
        
        /** 每个联系人的小字典. */
        NSDictionary *dic = [arr objectAtIndex:indexPath.row];
        
        cell.textLabel.text = [dic objectForKey:@"name"];
   
    }
    return cell;
}

//- (void)handleData {
//
//    self.dicContact = @{
//                        
//                        @"Z":@[@{@"name":@"zhangsan",
//                                 @"phone":@"12534645"},
//                               @{@"name":@"zisi",
//                                 @"phone":@"4584812"},
//                               @{@"name":@"zwangwu",
//                                 @"phone":@"2152451"}],
//                        @"L":@[@{@"name":@"liaoming",
//                                 @"phone":@"4865326"}],
//                        @"Y":@[@{@"name":@"ysawe",
//                                 @"phone":@"2155"},
//                               @{@"name":@"yuming",
//                                 @"phone":@"1245"}]
//               
//                        }.mutableCopy;
//    /** 将字典中的所有Key取出来,并且排序. */
//    self.arrKey = [[self.dicContact allKeys] sortedArrayUsingSelector:@selector(compare:)].mutableCopy;
//
//    self.arrKey = [NSMutableArray arrayWithArray:[self.dicContact allKeys]];
//    [self.arrKey sortUsingSelector:@selector(compare:)];
//
//
//
//}

- (void)handleDataFromPlist {
    /** 创建plist文件. */
    
    /** 将plist文件转化为字典. */
    
    /** 找出plist文件的路径. */
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Contacts" ofType:@"plist"];

    /** 生成字典. */
    self.dicContact = [NSMutableDictionary  dictionaryWithContentsOfFile:path];
    
    self.arrKey = [self.dicContact allKeys].mutableCopy;
    NSLog(@"%@",self.dicContact);
}

#pragma mark - tableView dataSourse

/** 分区数. */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.arrKey.count;

}

/**  每个分区的行数. */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    /** 从arrKey中取出key. */
    NSString *key = [self.arrKey objectAtIndex:section];
    
    /** 根据key从字典中获取数组. */
    NSArray *arr = [self.dicContact objectForKey:key];
    
    /**返回arr的个数. */
    return arr.count;
}


/** 右侧索引部分. */
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {

    return self.arrKey;

}



/** 每个分区的区头标题. */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    return [self.arrKey objectAtIndex:section];


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
