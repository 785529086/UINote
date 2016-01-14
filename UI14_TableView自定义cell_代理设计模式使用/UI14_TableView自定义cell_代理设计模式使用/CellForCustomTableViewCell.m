//
//  CellForCustomTableViewCell.m
//  UI14_TableView自定义cell_代理设计模式使用
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 lanou.com. All rights reserved.
//


#define WIDTH self.contentView.frame.size.width
#define HEIGHT self.contentView.frame.size.height

#import "CellForCustomTableViewCell.h"
#import "ScrollForCell.h"

@interface CellForCustomTableViewCell ()

@property (nonatomic, retain) ScrollForCell * scroll;
@property (nonatomic, retain) UIButton *btnForDele;
@property (nonatomic, retain) UIButton *btnForEdit;

@end


@implementation CellForCustomTableViewCell


- (void)dealloc {

    [_scroll release];
    [_btnForDele release];
    [_btnForEdit release];
    [_labelForTitle release];
    [super dealloc];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createSubViews];
        
    }
    return self;
}

/**
 * @brief
 *
 * @param
 *
 * @return
 **/
- (void)createSubViews {
 
    //    scrollView
    self.scroll = [[ScrollForCell alloc]init];
    [self.contentView addSubview:self.scroll];
    [_scroll release];
    self.scroll.backgroundColor = [UIColor redColor];
    
    self.scroll.showsHorizontalScrollIndicator = NO;
    self.scroll.bounces = YES;
    self.scroll.pagingEnabled = YES;
    
    //    btnForDele
    self.btnForDele = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.scroll addSubview:self.btnForDele];
//    [self.btnForDele setTitle:@"Delete" forState:UIControlStateNormal];

//    [self.btnForDele setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    [self.btnForDele setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    self.btnForDele.backgroundColor = [UIColor yellowColor];
    [self.btnForDele addTarget:self action:@selector(handleDele:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //    btnForEdit
    self.btnForEdit = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.scroll addSubview:self.btnForEdit];
    [self.btnForEdit setTitle:@"Edit" forState:UIControlStateNormal];
    self.btnForEdit.backgroundColor = [UIColor lightTextColor];
    
    //    labelForTitle
    self.labelForTitle = [[UILabel alloc]init];
    [self.scroll addSubview:self.labelForTitle];
    [_labelForTitle release];
    self.labelForTitle.backgroundColor = [UIColor whiteColor];
}

- (void)handleDele:(UIButton *)button {

//    if ([self.delegate respondsToSelector:@selector(handleDeleAction:)]) {
    
    [self.delegate handleDeleAction:self];
        
//    }
}


- (void)layoutSubviews {
    [super layoutSubviews];
    

    // scrollView
    self.scroll.frame = self.contentView.frame;
    self.scroll.contentSize = CGSizeMake(WIDTH + 50 + 80,HEIGHT);
    self.btnForEdit.frame = CGRectMake(WIDTH, 0, 50, HEIGHT);
    self.btnForDele.frame = CGRectMake(WIDTH + 50, 0, 80, HEIGHT);
    
    // label
    self.labelForTitle.frame = CGRectMake(10, 10, 100, HEIGHT - 20);


}




- (void)awakeFromNib {
    
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
