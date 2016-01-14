//
//  TouchView.m
//  UI09代理设计模式新思考
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

  [self.delegate beginClick];
    

}

-  (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    //
    if ([self.delegate respondsToSelector:@selector(didClick)]) {
        
        [self.delegate didClick];

    }
  

}


@end
