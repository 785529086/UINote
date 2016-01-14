//
//  ViewController.m
//  UI11_UITableView编辑(cell的删除 插入 移动)
//
//  Created by dllo on 15/12/25.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arr;

@end

@implementation ViewController


- (void)dealloc {
    [_tableView release];
    [super dealloc];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    
    self.title = @"TableView编辑状态";
    [self createTableView];
    [self handleAction];
    [self tableViewIsEdit];
}

- (void)createTableView {

    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
   [self.view addSubview:self.tableView];
    [_tableView release];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arr.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

   static  NSString *poolName = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:poolName];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:poolName];
    }
    NSDictionary *dic = [self.arr objectAtIndex:indexPath.row];
    cell.textLabel.text = [dic objectForKey:@"title"];
   
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

        /** 实现删除功能. */
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        /** 从数据源(数组)中删除数据. */
        [self.arr removeObjectAtIndex:indexPath.row];
        
        /** tableView 删除cell. */
    
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation: UITableViewRowAnimationLeft];
    }else if /** 判断是插入状态. */
        (UITableViewCellEditingStyleInsert == editingStyle)
    {
        /** 更新数据源. */
        
        [self.arr insertObject:@{@"title":@"wang"} atIndex:indexPath.row];
        
        /** tableView 插入cell. */
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}


#pragma marrk ** cell 移动相关的方法. 
/** 确定哪些行可以移动. */
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {

    return  YES;

}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{

    /** 此方法中不写代码,cell就可以实现移动.
     * 因此, 此方法中的代码主要是更新数据.
     */
    /** 找对象. */
    NSString *str = [[self.arr objectAtIndex:fromIndexPath.row] retain];
    
    /** 对象先从数组中移除掉. */
    [self.arr removeObjectAtIndex:fromIndexPath.row];
    
    /** 然后对象再插入数组中. */

    [self.arr insertObject:str atIndex:toIndexPath.row];
    
    [str release];
    
}

#pragma mark - tableView Delegate.
/** 确定每行的编辑风格(删除, 添加). */
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {

    /** 需求: 第一行添加,其他行如下效果. */
    switch (indexPath.row) {
        case 0:
            return 2;
            break; /** 插入风格. */
        case 1:
            return 0;
            break;/** 选中状态. */
        case 2:
            return 1|2;
            break;
            
        default:
            return UITableViewCellEditingStyleDelete;/** 删除风格. */
            break;
    }
}

#pragma mark ** cell编辑相关的方法.
/** 确定哪些行可以进入编辑状态. */
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    

    /** 如果想控制某些行进入编辑状态,使用indexPath参数,判断具体行.
     *
     *注意:返回yes,可以编辑, 返回No,不能编辑, 
     *默认(此方法不用实现),都可以编辑.
     *
     */

    return YES;

}

- (void)handleAction {
    
    self.arr = @[
             @{@"title":@"zhang"},
             @{@"title":@"wang"},
             @{@"title":@"li"},
             @{@"title":@"tom"}].mutableCopy;

}

#pragma mark - 让TableView 进入到编辑状态

- (void)tableViewIsEdit {

    /** 利用VC 的一个封装方法,在导航栏上添加一个BarButton. 
     当点击button时,会调用下面的setEditing:(BOOL)editing animated:(BOOL)animated方法. */
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    
    /* 必须先调用父类方法. */
    [super setEditing:editing animated:animated];

    /** 让TableView 进入/退出 编辑状态. */
    [self.tableView setEditing:editing animated:animated];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
