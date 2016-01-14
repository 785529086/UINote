//
//  CellOfNew.m
//  UI13_UITableViewCell自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "CellOfNew.h"
#import "ModelOfNews.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width


@interface CellOfNew ()

@property (nonatomic, retain) UILabel *labelOfTitle;
@property (nonatomic, retain) UILabel *labelOfSummary;

@end

@implementation CellOfNew



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createLabel];
        
    }
    return self;
}

- (void)createLabel {
    
    self.labelOfTitle = [[UILabel alloc]init];
    [self.contentView addSubview:self.labelOfTitle];;
    [_labelOfTitle release];
    self.labelOfTitle.numberOfLines = 0;
    
    self.labelOfSummary = [[UILabel alloc]init];
    [self.contentView addSubview:self.labelOfSummary];
    [_labelOfSummary release];
    self.labelOfSummary.numberOfLines = 0;
}


- (void)passModel:(ModelOfNews *)model {
    
    self.labelOfTitle.text = model.title;
    self.labelOfSummary.text = model.summary;
    
    
}

/** 布局子视图. */
- (void)layoutSubviews {
    
    [super layoutSubviews];
    /** 子控件frame设置. */
    self.labelOfTitle.frame = CGRectMake(10, 10, WIDTH - 20, 50);
    self.labelOfSummary.frame = CGRectMake(10, 10 + 50 + 10, WIDTH - 20, [[self class] heightForLabel:self.labelOfSummary.text] );
    
}

+ (CGFloat)heightForLabel:(NSString *)text {

    CGRect rect = [text boundingRectWithSize:CGSizeMake(WIDTH - 20 , 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:17]} context:nil];
    return rect.size.height;

}

+ (CGFloat)heightForCell:(ModelOfNews *)model {
    
    /** CGSize参数指的是给定的一个cell 的预估值,*/
//    CGRect rect = [model.summary boundingRectWithSize:CGSizeMake(WIDTH, 0) options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
//    return rect.size.height + 10 + 50 + 10 + 10;


  CGFloat height = [CellOfNew heightForLabel:model.summary];
    return height + 10 + 50 + 10 + 10;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
