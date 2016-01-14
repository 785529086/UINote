//
//  Cell.m
//  UI06_Homework_ScrollView
//
//  Created by Scott on 15/12/23.
//  Copyright © 2015年 Scott. All rights reserved.
//

#import "Cell.h"

@interface Cell ()

@property (nonatomic, retain) UIImageView *imageViewPic;

@property (nonatomic, retain) UILabel *labelName;

@property (nonatomic, retain) UILabel *labelPhone;

@end

@implementation Cell


- (void)dealloc {
    [_imageViewPic release];
    [_labelName release];
    [_labelPhone release];
    [super dealloc];
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        
        /** 创建三个控件. */
        [self createImageViewWithFrame:frame];
        
        [self createTwoLabelWithFrame:frame];
        
        
    }
    return self;

}

- (void)createTwoLabelWithFrame:(CGRect)frame {
    
    self.labelName = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width / 3 + 10, 5, frame.size.width / 3 * 2 - 15, (frame.size.height - 15) / 2)];
    self.labelName.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.labelName];
    [_labelName release];

    
    self.labelPhone = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width / 3 + 10, 5 + (frame.size.height - 15) / 2 + 5 , frame.size.width / 3 * 2 - 15, (frame.size.height - 15) / 2)];
    
    
    self.labelPhone.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.labelPhone];
    [_labelPhone release];
    
    
}

- (void)createImageViewWithFrame:(CGRect)frame {
    
    self.imageViewPic = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3.jpg"]];
    
    self.imageViewPic.frame = CGRectMake(5, 5, frame.size.width / 3, frame.size.height - 10);
    [self addSubview:self.imageViewPic];
    [_imageViewPic release];
}













/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
