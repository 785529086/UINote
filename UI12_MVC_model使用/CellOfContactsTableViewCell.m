//
//  CellOfContactsTableViewCell.m
//  UI12_MVC_model使用
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "CellOfContactsTableViewCell.h"
#import "Contact.h"

@interface CellOfContactsTableViewCell ()

@property (nonatomic, retain) UIImageView *imageViewLeft;
@property (nonatomic, retain) UILabel *labelName;

@end

@implementation CellOfContactsTableViewCell

- (void)dealloc {

    [_imageViewLeft release];
    [_labelName release];
    [super dealloc];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;





}

- (void)createSubViews {

    self.imageViewLeft = [[UIImageView alloc]init];
    [self.contentView addSubview:self.imageViewLeft];
    [_imageViewLeft release];
    
    
    self.labelName = [[UILabel alloc]init];
    [self.contentView addSubview:self.labelName];
    [_labelName release];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.contentView.frame.size.width;
    CGFloat height = self.contentView.frame.size.height;
    
    self.imageViewLeft.frame = CGRectMake(10, 10, height - 20, height - 20);
    self.labelName.frame = CGRectMake(width - height - 20 - 10, 10, width - (width - height - 20 - 10) - 10 , height - 20);
}

/** 重写属性con的set方法. */
- (void)setCon:(C_ontact *)con {
 
    if (_con != con) {
        
        [_con release];
        _con = [con retain];
    }
    
    /** 子控件赋值. */
    self.imageViewLeft.image = [UIImage imageNamed:con.photo];
    self.labelName.text = con.name;
}

- (void)passModel:(C_ontact *)con {

    /** 子控件赋值*/
    self.imageViewLeft.image = [UIImage imageNamed:con.photo];
    self.labelName.text = con.name;
}





- (void)awakeFromNib {
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
