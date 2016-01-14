//
//  ViewController.m
//  UI15_可视化编程_约束
//
//  Created by dllo on 15/12/31.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "CellForView.h"
#import "ModelForList.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>


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


- (void)handleData {

    self.arr = [NSMutableArray array];
    /** JSON 文件解析.*/
    NSString *path = [[NSBundle mainBundle]
    pathForResource:@"activitylist" ofType:@"txt"];
    
    /** 将文件转化为二进制数据对象. */
    NSData *data = [NSData dataWithContentsOfFile:path];

    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    /** 数据处理. */
    NSArray *arr = [result objectForKey:@"events"];
    for (NSDictionary *dic in arr) {
        ModelForList *model = [[ModelForList alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [self.arr addObject:model];
        [model release];

    }
}


- (void)createTableView {

    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [_tableView release];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    /** 注册cell. */
//    [self.tableView registerNib:[UINib nibWithNibName:@"CellForView" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"pool"];
    
    UINib *nib = [UINib nibWithNibName:@"CellForView" bundle:[NSBundle mainBundle]];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:@"pool"];
 
}


#pragma mark - tableView dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CellForView *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];
    
    
    ModelForList *model = [self.arr objectAtIndex:indexPath.row];
    [cell passValue:model];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 230;
}

#pragma mark - tableView delegate

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
