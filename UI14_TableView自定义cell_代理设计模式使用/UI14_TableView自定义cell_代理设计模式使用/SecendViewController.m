//
//  SecendViewController.m
//  UI14_TableView自定义cell_代理设计模式使用
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "SecendViewController.h"

@interface SecendViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arr;

@end

@implementation SecendViewController


- (void)dealloc {

    [_tableView release];
    [_arr release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableView];
    [self handleData];
}

- (void)handleData {
    
    self.arr = @[@"zhang",@"wang",@"li",@"ai",@"haha"].mutableCopy;

}

- (void)createTableView {

    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [_tableView release];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"pool"];
 
}

#pragma mark - tableView dataSource 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];

    cell.textLabel.text = [self.arr objectAtIndex:indexPath.row];
    
    return cell;
    
}




#pragma mark - tableView delegate
/** iOS8 推出新API,右侧滑动cell 出现附加控件. . */

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    /** 创建多个rowAction对象. */
    
    UITableViewRowAction *actionEdit = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Edit" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
       
        [self alertControllerForEdit];
        
        
    }];
    
    UITableViewRowAction *actionDele = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Delete" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"ddd");
        
        [self alertControllerWithIndexPath:indexPath];
        
    }];
    
    return @[actionEdit, actionDele];
    
    
}


#pragma mark - alertController 

/** UIAlertController. 详见API. */
- (void)alertControllerWithIndexPath:(NSIndexPath *)indexpath {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否删除" preferredStyle: UIAlertControllerStyleAlert];
    
    
    /** 添加action. */
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"Ok" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"dadad");
        /** 取出两个textField的内容. */
        NSArray *arr = alert.textFields;
        for (UITextField *tf in arr) {
            NSLog(@"%@",tf.text);
        }
        
        
        
    }];
    
    UIAlertAction *actionDele = [UIAlertAction actionWithTitle:@"Cancel" style: 1 handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"hahah");
    }];
    
    
    
    
    UIAlertAction *actionDetail = [UIAlertAction actionWithTitle:@"Delete" style: 2 handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"dadadad");
        
        /** 删除cell. */
        [self deleteCell:indexpath];
        
        
        
    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
      textField.placeholder = @"请输入用户名: ";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入密码:";
        
        /** 密文输入. */
        textField.secureTextEntry = YES;
        
    }];
    
   
    [alert addAction:actionDetail];
    [alert addAction:actionOk];
    [alert addAction:actionDele];
    

    /** 模态推出. */
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}

- (void)deleteCell:(NSIndexPath *)indexpath {

    /** 数据*/
    [self.arr removeObjectAtIndex:indexpath.row];
    
    /** tableView删cell.  UI部分 */
    [self.tableView deleteRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationMiddle];
}

- (void)alertControllerForEdit {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否编辑" preferredStyle: UIAlertControllerStyleActionSheet];
    /** 添加action. */
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"Ok" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"ssse");
    }];
    
    UIAlertAction *actionCabcel = [UIAlertAction actionWithTitle:@"Candel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"lallal");
    }];
    
    [alert addAction:actionCabcel];
    [alert addAction:actionOK];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
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
