//
//  ViewController.m
//  UI12_MVC_model使用
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "Contact.h"
#import "CellOfContactsTableViewCell.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arrKey;
@property (nonatomic, retain) NSMutableDictionary *dicContacts;

@end

@implementation ViewController

- (void)dealloc {
    [_arrKey release];
    [_tableView release];
    [_dicContacts release];
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self handleData];
    [self createTableView];
    
}
- (void)handleData {

    self.dicContacts = [NSMutableDictionary dictionary];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"Contacts" ofType:@"plist"];
    NSMutableDictionary *dicTemp = [NSMutableDictionary dictionaryWithContentsOfFile:path];

    
    /** 遍历dicTemp字典,将数据转成 model对象. */
    for (NSString *key in dicTemp) {
        NSArray *arr = [dicTemp objectForKey:key];

        
        /** 初始化数组. */
        NSMutableArray *mArr = [NSMutableArray array];

        
        /** 遍历数组. */
        for (NSDictionary *dic in arr) {
            C_ontact *cont = [[C_ontact alloc]init];
            
            /** KVC 方法. 注意:对于未识别到的key的处理.*/
            [cont setValuesForKeysWithDictionary:dic];
            [mArr addObject:cont];
            [cont release];
        }
        /** 添加到字典中. */
        [self.dicContacts setObject:mArr forKey:key];
    }
    
    NSLog(@"%@",self.dicContacts);
    
    self.arrKey = [NSMutableArray arrayWithArray:[self.dicContacts allKeys]];
//    [self.arrKey sortedArrayUsingSelector:@selector(compare:)];
    
    [self.arrKey sortUsingSelector:@selector(compare:)];

//     [self.arrKey sortedArrayUsingSelector:@selector(compare:)];
    
    NSLog(@"%@",self.arrKey);
    
    

}

- (void)createTableView {
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
   
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [_tableView release];
    
    /** 注册cell. */
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"pool1"];
  
    [self.tableView registerClass:[CellOfContactsTableViewCell class] forCellReuseIdentifier:@"pool2"];
    
}

#pragma mark - tableView DataSource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.arrKey objectAtIndex:section];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

//    NSLog(@"hahah");
    return self.arrKey.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSString *key = [self.arrKey objectAtIndex:section];

    return [[self.dicContacts objectForKey:key]count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /** 返回cell 的第二种写法(推荐). 
     *
     * 1. tableView 注册一个cell类.绑定一个重用池. 
     * 2. 从重用池中直接取cell, 如果cell为空,系统会自动根据和重用池绑定的Cell类创建cell对象. */
    
    if (indexPath.section == 0) {
        /** 此处没有If判断. 是因为重用池若没有cell.系统会自动创建一个这样的cell. */
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
        NSString *key = [self.arrKey objectAtIndex:indexPath.section];
        NSArray *arr = [self.dicContacts objectForKey:key];
        C_ontact *con = [arr objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:con.photo];
        cell.textLabel.text = con.name;

        return cell;
        
    }else {
        
        CellOfContactsTableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:@"pool2"];
        NSString *key = [self.arrKey objectAtIndex:indexPath.section];
        
        NSArray *arr = [self.dicContacts objectForKey:key];
        
        C_ontact *con = [arr objectAtIndex:indexPath.row];
        
        /* cell赋值. 
         *
         *思路: 将model 数据传入自定义cell中, 在cell类里面完成cell上子控件的赋值过程.
         
         cell.imageViewLeft.image = [UIImage imageNamed:con.photo];
         cell.labelName.text = con.name;
         *    MRC 下可以重写setter 方法, 但是不适用于ARC
            cell.con = con;
         * 
         * ARC下, 可以通过方法实现 , MRC同样适用.
         */
        [cell passModel:con];
        
        return cell;
    
    }
}

#pragma mark - tableView Delegate


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
