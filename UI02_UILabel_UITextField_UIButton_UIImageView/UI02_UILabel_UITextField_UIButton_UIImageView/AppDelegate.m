//
//  AppDelegate.m
//  UI02_UILabel_UITextField_UIButton_UIImageView
//
//  Created by dllo on 15/12/15.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<UITextFieldDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIViewController *vc = [[UIViewController alloc] init];
    self.window.rootViewController = vc;
    
    [self labelView];
    [self textFieldView];
    [self buttonView];
    [self imageView];

    [vc release];
    [_window release];

    return YES;
}
#pragma mark - 知识点1: UILabel
- (void)labelView {
    /** 1.创建对象.*/
    UILabel *label_name = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 80, 50)];
    
    label_name.backgroundColor = [UIColor orangeColor];
    [self.window addSubview:label_name];
    [label_name release];
    
    /** 2. 常用API */
    label_name.text = @"用户名:";
    label_name.textColor = [UIColor blueColor];
    /** 文本对齐 */
    label_name.textAlignment = NSTextAlignmentRight;
    /** 文本字体 */
    label_name.font = [UIFont systemFontOfSize:20];
    /** 文本行数. 0没有行数限制. */
    label_name.numberOfLines = 3;
    /** 断行和省略模式. */
    label_name.lineBreakMode = NSLineBreakByTruncatingHead;
    /** 阴影颜色. */
    label_name.shadowColor = [UIColor blackColor];
    /** 阴影的偏移量(Offset). */
    label_name.shadowOffset = CGSizeMake(2, 2);
    
    
    UILabel *label_key = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 80, 50)];
    label_key.backgroundColor = [UIColor blueColor];
    [self.window addSubview:label_key];
    [label_key release];
    
    label_key.text = @"密码:";
    label_key.textColor = [UIColor greenColor];
    label_key.textAlignment = NSTextAlignmentRight;
    label_key.font = [UIFont systemFontOfSize:20];
    label_key.numberOfLines = 3;
    label_key.lineBreakMode = NSLineBreakByTruncatingHead;
    label_key.shadowColor = [UIColor blackColor];
    label_key.shadowOffset = CGSizeMake(2, 2);
    

}
#pragma mark - 知识点2: UITextField 
- (void)textFieldView {
    /** 1. 创建对象. */
    UITextField *textFieldOfName = [[UITextField alloc] initWithFrame:CGRectMake(150, 50, 160, 40)];
    textFieldOfName.tag = 100;
    [self.window addSubview:textFieldOfName];
    [textFieldOfName release];
    
    /** 2. API. */
    /** 边框风格. */
    textFieldOfName.borderStyle = UITextBorderStyleRoundedRect;
    
    /** 占位符. */
    textFieldOfName.placeholder = @"请输入用户名";
    
    /** 安全输入. */
    textFieldOfName.secureTextEntry = NO;
    
    /** 弹出键盘的类型. */
    textFieldOfName.keyboardType  = UIKeyboardTypeDefault;
    
    /** 弹出键盘的风格(亮/暗). */
    textFieldOfName.keyboardAppearance = UIKeyboardAppearanceDark;

    /** 键盘回车按键类型. */
    textFieldOfName.returnKeyType = UIReturnKeyNext;
    
    
    /** 添加密码TextField */
    UITextField *textFieldOfKey = [[UITextField alloc] initWithFrame:CGRectMake(150, 150, 160, 40)];
    textFieldOfKey.tag = 200;
    [self.window addSubview:textFieldOfKey];
    [textFieldOfKey release];
    textFieldOfKey.borderStyle = UITextBorderStyleRoundedRect;
    textFieldOfKey.placeholder = @"请输入密码:";
    textFieldOfKey.secureTextEntry = YES;
    textFieldOfKey.keyboardAppearance = UIKeyboardAppearanceLight;
    textFieldOfKey.keyboardType = UIKeyboardTypeDefault;
    textFieldOfKey.returnKeyType = UIReturnKeyGo;
    
    
    /** 输入框后面的 清除按键. */
    textFieldOfKey.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    
#pragma mark ** textField delegate
    /** 指定delegate. */
    textFieldOfName.delegate = self;
    textFieldOfKey.delegate = self;
    
    
    
    

}

#pragma mark - TextField协议方法

/** 将要开始编辑的时候,调用此协议方法. */
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    NSLog(@"%s",__func__);
//    NSLog(@"%s",__FUNCTION__);
//    NSLog(@"%d",__LINE__);
    /** 输出所在的方法名(函数名),和行数. */

    NSLog(@"%d,%s",__LINE__,__FUNCTION__);

    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
  NSLog(@"%d,%s",__LINE__,__FUNCTION__);
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
 NSLog(@"%d,%s",__LINE__,__FUNCTION__);
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
 NSLog(@"%d,%s",__LINE__,__FUNCTION__);
}

/** 点击按键上的return按键时,调用此方法. */
- (BOOL)textFieldShouldReturn:(UITextField *)textField {

 NSLog(@"%d,%s",__LINE__,__FUNCTION__);
    
    
    UITextField *txPass = [self.window viewWithTag:200];
    /** 回收键盘. */
    
    if (textField.returnKeyType != UIReturnKeyNext) {
        
        /** 释放第一响应者. */
        [textField resignFirstResponder];
    }else {
        
        [textField resignFirstResponder];
        [txPass becomeFirstResponder];
    
    }
    
    return YES;
}

/** 清空内容时,调用此方法. */
- (BOOL)textFieldShouldClear:(UITextField *)textField {
 NSLog(@"%d,%s",__LINE__,__FUNCTION__);
    return YES;

}


/** 内容发生变化时, 调用此方法.  */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    NSLog(@"string:%@",string);
    NSLog(@"%ld,%ld",range.location,range.length);
    /** 限制输入长度. */
    if (range.location > 7) {
        return NO;
    }
    /** 限制不能输入的内容. */
    if ([string isEqualToString:@"1"]) {
        return NO;
    }

    return YES;
}

#pragma mark - 知识点3 :UIButton
- (void)buttonView {
    UIButton *buttonOfComfirm = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonOfComfirm.frame = CGRectMake(100, 200, 100, 40);
    [self.window addSubview:buttonOfComfirm];
    
    [buttonOfComfirm setTitle:@"确定" forState:UIControlStateNormal];
    
    /** 指定状态下的标题颜色. */
    [buttonOfComfirm setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    /** 添加事件. 
     * 控制事件:button向上弹出时调用方法. */
    [buttonOfComfirm addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
    [buttonOfComfirm addTarget:self action:@selector(handleDragAction:) forControlEvents:UIControlEventTouchDragInside];/* 拖动时事件. */
    
    UIButton *buttonIcon = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonIcon.frame = CGRectMake(100, 300, 50 , 50);
    
    [self.window addSubview:buttonIcon];
    
    [buttonIcon setBackgroundImage:[UIImage imageNamed:@"2.jpg"] forState:UIControlStateNormal];
    
    
    
}









- (void)handleAction:(UIButton *)button {

/** 验证用户名和密码是否正确. */
    UITextField *tfUser = [self.window viewWithTag:100];
    
    UITextField *tfKey = [self.window viewWithTag:200];
    
    /** 释放键盘. 
     *  endEditing 是UIview 的方法, 功能:释放view以及它的子视图的第一响应状态. */
//    [tfUser resignFirstResponder];
//    [tfKey resignFirstResponder];
    [self.window endEditing:YES];
    
    
    
    if ([tfUser.text isEqualToString:@"Tom"] && [tfKey.text isEqualToString:@"234567"]) {
        NSLog(@"输入正确.");
    }else {
        NSLog(@"请重新输入.");
    
    }

}

- (void)handleDragAction:(UIButton *)button {

}

#pragma mark - 知识点4 UIImageView
- (void)imageView {
    
    /** 1. 创建对象.*/
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    imageView.frame = CGRectMake(0, 0, 200, 250);
    imageView.center = self.window.center;
    [self.window addSubview:imageView];
    
    [UIView animateWithDuration:3 animations:^{
        imageView.center = CGPointMake(0, 0);
        imageView.alpha = 0;
    }];
    
    
    [imageView release];
}





#pragma mark
- (void)dealloc {
    [_window release];
    [super dealloc];
}



/**  Task: UIFont  UITextInput  shouldclear */

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
