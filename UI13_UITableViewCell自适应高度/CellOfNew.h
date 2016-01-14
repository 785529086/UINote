//
//  CellOfNew.h
//  UI13_UITableViewCell自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ModelOfNews;

@interface CellOfNew : UITableViewCell

- (void)passModel:(ModelOfNews *)model;

+ (CGFloat)heightForCell:(ModelOfNews *)model;

@end
