//
//  TouchView.h
//  UI04_UIEvent_UITouch
//
//  Created by dllo on 15/12/17.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TouchViewDelegate <NSObject>

- (void)changeBackColor;

@end
//@protocol <#protocol name#> <NSObject>
//
//<#methods#>
//
//@end

@interface TouchView : UIView

@property (nonatomic, retain) UITextField *textFieldContent;

@property (nonatomic, assign) id<TouchViewDelegate> delegate;

@end
