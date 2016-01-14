//
//  CellOfContactTableViewCell.h
//  UI2_UITableView自定义Cell
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellOfContactTableViewCell : UITableViewCell

/**  将cell上的子控件声明为属性,方便外边赋值.*/
@property (nonatomic, retain) UIImageView *imageViewCenter;
@property (nonatomic, retain) UIImageView *imageViewLeft;
@property (nonatomic, retain) UIImageView *imageViewRinght;

@end
