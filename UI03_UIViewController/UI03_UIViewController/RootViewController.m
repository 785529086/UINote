//
//  RootViewController.m
//  UI03_UIViewController
//
//  Created by dllo on 15/12/16.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "RootViewController.h"
#import "LTView.h"
@interface RootViewController ()<UITextFieldDelegate>
@property (nonatomic, retain)UIImageView *imageViewBack;
@end

@implementation RootViewController

#pragma mark - 知识点1 ViewController生命周期

/** ViewController第一方法,初始化方法, 虽然前面调用的是inint方法,但是无论采用何种初始化,都会调用此初始化方法. */
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"%s",__FUNCTION__);
    }
    return self;
}


/** 加载视图. ViewConttroller的view属性,要指定一个view对象.如果系统检测view属性没有指向一个view对象,系统会自动创建一个View对象.  */
- (void)loadView {
    /** 一定要调用父类的方法. */
    [super loadView];
    NSLog(@"%s",__FUNCTION__);

}


/** 视图加载完成. */
- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%s",__FUNCTION__);
    self.imageViewBack = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"QQ.jpg"]];
    [self.view addSubview:self.imageViewBack];
    self.imageViewBack.frame = self.view.frame;
    [self.imageViewBack release];
    
    /** 打开imageView用户交互. */
    self.imageViewBack.userInteractionEnabled = YES;
    
    /** 用户名和密码. */
    LTView *viewOfUser = [[ LTView alloc] initWithFrame:CGRectMake(50, 400, self.view.frame.size.width - 100, 40)];
    
    [self.imageViewBack addSubview:viewOfUser];
    
    [viewOfUser release];
    viewOfUser.labelOfLeft.text = @"用户名:";
    viewOfUser.textFieldOfRight.placeholder = @"请输入用户名";
    
    
    LTView *viewOfPasswd = [[LTView alloc] initWithFrame:CGRectMake(50, 500, self.view.frame.size.width - 100, 40)];
    [self.imageViewBack addSubview:viewOfPasswd];
    [viewOfPasswd release];
    viewOfPasswd.labelOfLeft.text = @"密码:";
    viewOfPasswd.textFieldOfRight.placeholder = @"请输入密码";
    
    
    viewOfUser.textFieldOfRight.delegate = self;
    viewOfPasswd.textFieldOfRight.delegate = self;
    
    
    
    
}

#pragma mark - textField协议方法
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    /**背景向上移动. */
    [UIView animateWithDuration:0.25 animations:^{
        
        self.imageViewBack.frame = CGRectMake(0, -100, self.view.frame.size.width, self.view.frame.size.height);}];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.imageViewBack.frame = self.view.frame;
        
        /** 回收键盘. */
        [textField resignFirstResponder];
        
    }];
    return YES;
}
/** 视图将要显示. */
- (void)viewWillAppear:(BOOL)animated {
    
    NSLog(@"%s",__FUNCTION__);

}

/** 视图已经显示. */
- (void)viewDidAppear:(BOOL)animated {
    
    NSLog(@"%s",__FUNCTION__);
}

/** 视图将要消失. */
- (void)viewWillDisappear:(BOOL)animated {
    
    NSLog(@"%s",__FUNCTION__);
}

/** 视图已经消失. */
- (void)viewDidDisappear:(BOOL)animated {

    NSLog(@"%s",__FUNCTION__);
}

/** ViewController可以检测到系统内存不足的警告,在此方法中,要释放适当内存. */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
