//
//  TouchView.h
//  UI09代理设计模式新思考
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TouchViewDelegate <NSObject>

- (void)beginClick;

- (void)didClick;

@end

@interface TouchView : UIView

@property (nonatomic, assign) id<TouchViewDelegate> delegate;


@end
