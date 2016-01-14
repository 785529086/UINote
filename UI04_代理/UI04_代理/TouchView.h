//
//  TouchView.h
//  UI04_代理
//
//  Created by dllo on 15/12/18.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TouchViewDelegate <NSObject>

- (void)changeBackColor;

- (void)changeBackFrime;

@end

@interface TouchView : UIView

@property (nonatomic, assign) id<TouchViewDelegate>delegate;
@end
