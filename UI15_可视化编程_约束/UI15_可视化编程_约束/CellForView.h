//
//  CellForView.h
//  UI15_可视化编程_约束
//
//  Created by dllo on 15/12/31.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ModelForList;
@interface CellForView : UITableViewCell




@property (retain, nonatomic) IBOutlet UIView *viewBack;
@property (retain, nonatomic) IBOutlet UILabel *title;
@property (retain, nonatomic) IBOutlet UIView *viewWhite;
@property (retain, nonatomic) IBOutlet UILabel *timeOfBegin;
@property (retain, nonatomic) IBOutlet UILabel *timeOfEnd;
@property (retain, nonatomic) IBOutlet UILabel *address;
@property (retain, nonatomic) IBOutlet UILabel *catagory;



- (void)passValue:(ModelForList *)model;

@end
