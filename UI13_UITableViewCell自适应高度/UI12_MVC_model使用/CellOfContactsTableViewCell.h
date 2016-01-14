//
//  CellOfContactsTableViewCell.h
//  UI12_MVC_model使用
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@class C_ontact;

@interface CellOfContactsTableViewCell : UITableViewCell



/** 声明一个model的属性,用来接受外部的model数据. */
@property (nonatomic, retain) C_ontact *con;

/** 声明一个方法, 传入一个model过来. */
- (void)passModel:(C_ontact *)con;

@end
