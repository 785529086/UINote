//
//  ViewController.m
//  UI09_
//
//  Created by dllo on 15/12/23.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "SecendViewController.h"

@interface ViewController ()

@property (nonatomic, retain) UITextField *textFieldName;
@property (nonatomic, retain) UITextField *textFieldPhone;
@property (nonatomic, retain) UIButton *button;

@end

@implementation ViewController

-(void)dealloc {

    [_textFieldName release];
    [_textFieldPhone release];
    [super dealloc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"首页";
    [self creatTwoLabel];
    [self createButton];
    
    
    
    
}

- (void)creatTwoLabel {
    self.textFieldName = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 40)];
    self.textFieldName.backgroundColor = [UIColor whiteColor];
    self.textFieldName.placeholder = @"请输入用户名";
    [self.view addSubview:self.textFieldName];
    
    
    self.textFieldPhone = [[UITextField alloc] initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 40)];
 
    self.textFieldPhone.backgroundColor = [UIColor whiteColor];
    self.textFieldPhone.placeholder = @"请输入密码";
    [self.view addSubview:self.textFieldPhone];
    
    [_textFieldPhone release];
    [_textFieldName release];
    

}


- (void)createButton {
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(50, 300, self.view.frame.size.width - 100, 40);
    [self.button setTitle:@"确认" forState:UIControlStateNormal];
    self.button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.button];
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)buttonAction:(UIButton *)button {
    
    /** 创建第二界面对象,注意,此时在内存中完成了开辟空间. */
   SecendViewController *secend = [[SecendViewController alloc] init];
    
    /** 找到第二界面对象,并且对其中的一个属性进行赋值,注意,此时,内存中的第二界面对象的属性值完成了赋值过程. */
    secend.strReceive = [NSString stringWithFormat:@"%@,%@",self.textFieldName.text,self.textFieldPhone.text];

   /** 导航控制器将第二页面推入栈中. */
  [self.navigationController pushViewController:secend animated:YES];
 
    [secend release];
    
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
