//
//  CellForListCollectionViewCell.m
//  UI23_豆瓣电影界面
//
//  Created by dllo on 16/1/13.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "CellForListCollectionViewCell.h"
#import "ModelForDouban.h"
#import "UIImageView+WebCache.h"
@interface CellForListCollectionViewCell ()

@property (nonatomic, retain) UIImageView *image;

@end

@implementation CellForListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
     
        self.image = [[UIImageView alloc]init];
        self.image.frame = self.contentView.frame;
        [self addSubview:self.image];
        
        
    }
    return self;
}

- (void)passModel:(ModelForDouban *)model {

    [self.image sd_setImageWithURL:[NSURL URLWithString:model.normal]];

}



- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {



}





- (void)awakeFromNib {
    // Initialization code
}

@end
