//
//  CellForCustomTableViewCell.h
//  UI14_TableView自定义cell_代理设计模式使用
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CellForCustomTableViewCell;

@protocol CellForCustomDelegate <NSObject>


- (void)handleDeleAction:(CellForCustomTableViewCell *)cell;


@end  

@interface CellForCustomTableViewCell : UITableViewCell

@property (nonatomic,retain) UILabel *labelForTitle;

@property (nonatomic, assign) id<CellForCustomDelegate> delegate;

@end
