//
//  CellForListCollectionViewCell.h
//  UI23_豆瓣电影界面
//
//  Created by dllo on 16/1/13.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModelForDouban;

@interface CellForListCollectionViewCell : UICollectionViewCell

- (void)passModel:(ModelForDouban *)model;

@end
