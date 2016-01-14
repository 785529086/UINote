//
//  ViewController.m
//  UI23_豆瓣电影界面
//
//  Created by dllo on 16/1/13.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "ModelForDouban.h"
#import "CellForListCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, retain) UICollectionViewFlowLayout *flowLayOut;
@property (nonatomic, retain) UICollectionView *collection;
@property (nonatomic, retain) NSMutableArray *arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self handleData];
    [self createCollectionView];
}

#pragma mark - 数据处理.

- (void)handleData {

    self.arr = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"douban" ofType:@"txt"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//    NSLog(@"%@",result);
    
    NSArray *arrTemp = [result objectForKey:@"subjects"];
    for (NSDictionary *dic in arrTemp) {
        ModelForDouban *model = [[ModelForDouban alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [model setValuesForKeysWithDictionary:[dic objectForKey:@"pic"]];
        [self.arr addObject:model];
        NSLog(@"%@",self.arr);
    }

    

}




#pragma mark - UICollectionViewFlowLayOut

- (void)createFlowLayOut {

    self.flowLayOut = [[UICollectionViewFlowLayout alloc]init];
    self.flowLayOut.itemSize = CGSizeMake((self.view.frame.size.width - 80) / 3, (self.view.frame.size.width - 80) / 3 * 4 / 3);
    self.flowLayOut.minimumInteritemSpacing = 20;
    self.flowLayOut.minimumLineSpacing = 20;
    self.flowLayOut.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    self.flowLayOut.headerReferenceSize = CGSizeMake(0, 100);
    self.flowLayOut.footerReferenceSize = CGSizeMake(0, 50);
    
    
}

#pragma mark - UICollectionView

- (void)createCollectionView {

    
    [self createFlowLayOut];
    self.collection = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:self.flowLayOut];
    [self.view addSubview:self.collection];
    self.collection.backgroundColor = [UIColor redColor];
    
    // delegate.
    self.collection.dataSource = self;
    self.collection.delegate = self;
    
    [self.collection registerClass:[CellForListCollectionViewCell class] forCellWithReuseIdentifier:@"pool"];
    
    
    // collectionView 的分区头部和尾部视图采用重用池机制.
    [self.collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"poolForHeader"];
    [self.collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"poolForFooter"];
    
    
    [self addLongGesture];
    
    
}

#pragma mark collect的item的移动.
- (void)addLongGesture {

    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPress:)];
    [self.collection addGestureRecognizer:longPress];

}

- (void)handleLongPress:(UILongPressGestureRecognizer *)longPress {

    // 根据长按手势的状态,调用item的移动方法.
    NSIndexPath *beginIndexPath = [self.collection indexPathForItemAtPoint:[longPress locationInView:self.collection]];
    NSLog(@"%@",beginIndexPath);
    // 如果没有点中item,直接退出.
    if (beginIndexPath == nil) {
        return;
    }
    
    switch (longPress.state) {
            // 根据手势所在view上的点找到item上的indexPath,
        case UIGestureRecognizerStateBegan:
            [self.collection beginInteractiveMovementForItemAtIndexPath:[self.collection indexPathForItemAtPoint:[longPress locationInView:self.collection]]];
            break;
        case UIGestureRecognizerStateChanged:[self.collection updateInteractiveMovementTargetPosition:[longPress locationInView:self.collection]];
            break;
        case UIGestureRecognizerStateEnded:[self.collection endInteractiveMovement];
            break;
        default:[self.collection cancelInteractiveMovement];
            break;
    }
}

#pragma mark CollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    

    CellForListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pool" forIndexPath:indexPath];
    
    ModelForDouban *model = [self.arr objectAtIndex:indexPath.item];
    [cell passModel:model];
    
    cell.backgroundColor = [UIColor cyanColor];
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
// 更新数据.

}


// 返回每个分区的头部和尾部重用视图.
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"poolForHeader" forIndexPath:indexPath];
        header.backgroundColor = [UIColor greenColor];
        return header;
    }
    else {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"poolForFooter" forIndexPath:indexPath];
        footer.backgroundColor = [UIColor greenColor];
        return footer;
    }
    
}

#pragma mark - UICollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"......");

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
