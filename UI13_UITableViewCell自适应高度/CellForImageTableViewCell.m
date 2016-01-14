//
//  CellForImageTableViewCell.m
//  UI13_UITableViewCell自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "CellForImageTableViewCell.h"

@implementation CellForImageTableViewCell

- (void)dealloc {
    
    [_imageViewForPic release];
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

    self.imageViewForPic = [[UIImageView alloc]init];
    [self.contentView addSubview:self.imageViewForPic];
    [_imageViewForPic release];
}

- (void)layoutSubviews {

    [super layoutSubviews];
    self.imageViewForPic.frame = CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, [[self class] heightForCellWithImage:self.imageViewForPic.image] );

    NSLog(@"hhah");
}

+ (CGFloat)heightForCellWithImage:(UIImage *)image {
    
    return image.size.height / (image.size.width *[UIScreen mainScreen].bounds.size.width - 20);

}
                                  

/** 等比例计算图片的高度. */
+ (CGFloat)heightForCellWithName:(NSString *)name {

    /** 创建UIImage对象. */
    UIImage *image = [UIImage imageNamed:name];
    NSLog(@"%f,%f",image.size.width,image.size.height);
    
    /** 利用image的size属性计算高度. */
    
    
    return image.size.height / (image.size.width *[UIScreen mainScreen].bounds.size.width - 20);
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
