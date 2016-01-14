//
//  CellForView.m
//  UI15_可视化编程_约束
//
//  Created by dllo on 15/12/31.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "CellForView.h"

#import "ModelForList.h"
@interface CellForView ()
//
//@property (retain, nonatomic) IBOutlet UIView *viewBack;
//@property (retain, nonatomic) IBOutlet UILabel *title;
//@property (retain, nonatomic) IBOutlet UIView *viewWhite;
//@property (retain, nonatomic) IBOutlet UILabel *timeOfBegin;
//@property (retain, nonatomic) IBOutlet UILabel *timeOfEnd;
//@property (retain, nonatomic) IBOutlet UILabel *address;
//@property (retain, nonatomic) IBOutlet UILabel *catagory;



//@property (nonatomic, copy)NSString *title;
//@property (nonatomic, copy)NSString *begin_time;
//@property (nonatomic, copy)NSString *end_time;
//@property (nonatomic, copy)NSString *address;
//@property (nonatomic, copy)NSString *category_name;
//@property (nonatomic, copy)NSString *wisher_count;
//@property (nonatomic, copy)NSString *participant_count;

@end

@implementation CellForView



- (void)layoutSubviews {

    [super layoutSubviews];
    self.title.numberOfLines = 0;
    self.viewBack.layer.cornerRadius = 20;
    self.viewWhite.layer.cornerRadius = 5;
    self.viewWhite.layer.shadowOffset = CGSizeMake(0, 1);
    self.viewWhite.layer.shadowOpacity = 1;

}


- (void)passValue:(ModelForList *)model {

    static NSRange range = {5,11};
    self.title.text = model.title;
    
    
    self.timeOfBegin.text = [model.begin_time substringWithRange:range];
    self.timeOfEnd.text = [model.end_time substringWithRange:range];
    
    
    self.address.text = model.address;
    self.catagory.text = model.category_name;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
