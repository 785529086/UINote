//
//  CellOfContactTableViewCell.m
//  UI2_UITableView自定义Cell
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "CellOfContactTableViewCell.h"

@implementation CellOfContactTableViewCell

- (void)dealloc {

    [_imageViewCenter release];
    [_imageViewLeft release];
    [_imageViewRinght release];
    [super dealloc];
}


/** 子控件的创建. 一般选择cell在创建的时候.  */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
     
        /** 3个子控件的创建. */
        NSLog(@"%s, %f,%f",__func__,self.contentView.frame.size.width,self.contentView.frame.size.height);
        [self createSubViews];
        

        
    }
    return self;
}


- (void)createSubViews {
    
    
        self.imageViewLeft = [[UIImageView alloc] init];
        self.imageViewLeft.backgroundColor = [UIColor redColor];
        /** 注意是加在contentView视图上. */
        [self.contentView addSubview:self.imageViewLeft];
        [_imageViewLeft release];
    
    self.imageViewCenter = [[UIImageView alloc]init];
    self.imageViewCenter.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:self.imageViewCenter];
    [_imageViewCenter release];
    
    self.imageViewRinght = [[UIImageView alloc]init];
    self.imageViewRinght.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.imageViewRinght];
    [_imageViewRinght release];


}



/** 子控件的frame设置. 一般是在layoutSubviews方法中设置.
 * layoutSubviews 是UIView的方法. */

- (void)layoutSubviews {/** 是什么时候走这方法的? 查查什么时候会触发这种方法. 跟dealloc类似.  */
    
    /** 必须先调用父类方法. */
    [super layoutSubviews];
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    
    self.imageViewLeft.frame = CGRectMake(10, 10, (width - 40) / 3, height - 20);
    self.imageViewCenter.frame = CGRectMake(20 + (width - 40) / 3, 10, (width - 40) / 3, height - 20);
    self.imageViewRinght.frame = CGRectMake(30 +(width - 40) / 3 * 2, 10, (width - 40) / 3, height - 10);
    
    NSLog(@"subView:%s,%f,%f",__func__,self.contentView.frame.size.width, self.contentView.frame.size.height);
}


/**  当cell 从xib文件进入时,调用此方法. */
- (void)awakeFromNib {
    // Initialization code
}

/** 当点击Cell时,调用此方法 . */
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
