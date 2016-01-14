//
//  ViewController.m
//  计算器2
//
//  Created by Scott on 15/9/21.
//  Copyright © 2015年 Scott. All rights reserved.
//



#import "ViewController.h"

#pragma mark - 宏

#define FONT [UIFont systemFontOfSize:50]
#define COLOR [UIColor orangeColor]

#pragma mark -


@interface ViewController ()

@property (nonatomic, retain) UILabel *displayLabel;

@property (nonatomic, assign) float number1;
@property (nonatomic, assign) float number2;

@property (nonatomic, copy) NSString *sign; /**< 记录四则运算符号: + - x /  */

@property (nonatomic, assign) BOOL cal;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /* view 的背景颜色设置为黑色 */
    self.view.backgroundColor = [UIColor blackColor];
    
    NSArray *numArr = [NSArray arrayWithObjects:@"7", @"8", @"9", @"4", @"5", @"6", @"1", @"2", @"3", nil];
    
    
    
    
#pragma mark - 创建 1 ~ 9按键
    /* 1. 创建 1 ~ 9 按键, 两层for循环 */
    int n = 0;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            
            button.frame = CGRectMake(j * 93 + j * 1, 291 + i * 93 + i * 1, 93, 93);
            
            /* 设置Button的背景颜色 */
            button.backgroundColor = [UIColor lightGrayColor];
            
            /* 设置button 的title */
            NSString *title = [numArr objectAtIndex:n++];
            [button setTitle:title forState:UIControlStateNormal];
            
            /* 设置Button的标题字体大小 */
            button.titleLabel.font = FONT;
            
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            /* 将Button添加在View上 */
            [self.view addSubview:button];
            
        }
    }
    
    

#pragma mark - 创建 0 C = 三个按键
    
    /* 0 */
    UIButton *button0 = [UIButton buttonWithType:UIButtonTypeSystem];
    button0.frame = CGRectMake(0, 291 + 94 * 3, 93, 93);
    button0.titleLabel.font = FONT;
    button0.backgroundColor = [UIColor lightGrayColor];
    [button0 setTitle:@"0" forState:UIControlStateNormal];
    [self.view addSubview:button0];
    [button0 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button0 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    /* C */
    UIButton *buttonC = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonC.frame = CGRectMake(94, 291 + 94 * 3, 93, 93);
    buttonC.titleLabel.font = FONT;
    buttonC.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:buttonC];
    [buttonC setTitle:@"C" forState:UIControlStateNormal];
    [buttonC setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonC addTarget:self action:@selector(clear:) forControlEvents:UIControlEventTouchUpInside];
    
    /* = */
    UIButton *buttonEqul = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonEqul.frame = CGRectMake(94 * 2, 291 + 94 * 3, 93, 93);
    buttonEqul.titleLabel.font = FONT;
    buttonEqul.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:buttonEqul];
    [buttonEqul setTitle:@"=" forState:UIControlStateNormal];
    [buttonEqul setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonEqul addTarget:self action:@selector(resultAction:) forControlEvents:UIControlEventTouchUpInside];

    
#pragma mark - 创建 + - x / 四个按键
    
    /* + */
    UIButton *buttonAdd = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonAdd.frame = CGRectMake(94 * 3, 291, 93, 93);
    [self.view addSubview:buttonAdd];
    buttonAdd.backgroundColor = [UIColor orangeColor];
    [buttonAdd setTitle:@"+" forState:UIControlStateNormal];
    [buttonAdd setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buttonAdd.titleLabel.font = FONT;
    [buttonAdd addTarget:self action:@selector(calAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    /* - */
    UIButton *buttonSub = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonSub.frame = CGRectMake(94 * 3, 291 + 94, 93, 93);
    buttonSub.backgroundColor = COLOR;
    [buttonSub setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonSub setTitle:@"-" forState:UIControlStateNormal];
    [self.view addSubview:buttonSub];
    buttonSub.titleLabel.font = FONT;
    [buttonSub addTarget:self action:@selector(calAction:) forControlEvents:UIControlEventTouchUpInside];

    /* X */
    UIButton *buttonMul = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonMul.frame = CGRectMake(94 * 3, 291 + 94 + 94, 93, 93);
    buttonMul.backgroundColor = COLOR;
    [buttonMul setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonMul setTitle:@"x" forState:UIControlStateNormal];
    [self.view addSubview:buttonMul];
    buttonMul.titleLabel.font = FONT;
    [buttonMul addTarget:self action:@selector(calAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    /* / */
    UIButton *buttonDivi = [UIButton buttonWithType:UIButtonTypeSystem];
    buttonDivi.frame = CGRectMake(94 * 3, 291 + 94 + 94 + 94, 93, 93);
    buttonDivi.backgroundColor = COLOR;
    [buttonDivi setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonDivi setTitle:@"/" forState:UIControlStateNormal];
    [self.view addSubview:buttonDivi];
    buttonDivi.titleLabel.font = FONT;
    [buttonDivi addTarget:self action:@selector(calAction:) forControlEvents:UIControlEventTouchUpInside];
    
#pragma mark - 结果显示区域
    
    self.displayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 290)];
    self.displayLabel.backgroundColor = [UIColor lightGrayColor];
    self.displayLabel.text = @"";
    self.displayLabel.textAlignment = NSTextAlignmentRight;
    self.displayLabel.font = FONT;
    [self.view addSubview:self.displayLabel];
    
}



#pragma mark - 点击数字按键
- (void)buttonAction:(UIButton *)numButton
{
    
    if ([self.displayLabel.text hasPrefix:@"+"] ||
        [self.displayLabel.text hasPrefix:@"-"] ||
        [self.displayLabel.text hasPrefix:@"x"] ||
        [self.displayLabel.text hasPrefix:@"/"]) {
        
        self.displayLabel.text = @"";
    }
    
    
    if (self.cal == YES) {
        return;
    }
    
    
    NSString *numStr = numButton.currentTitle;
    self.displayLabel.text = [NSString stringWithFormat:@"%@%@", self.displayLabel.text, numStr];
    
    
    self.number1 = [self.displayLabel.text floatValue];
}


#pragma mark - 清除按键
- (void)clear:(UIButton *)clearButton
{
    
    self.displayLabel.text = @"";
    self.cal = NO;
    
}


#pragma mark - = 按键
- (void)resultAction:(UIButton *)resultButton
{
    
    
    if ([self.sign isEqualToString:@"+"]) {
        
        float result = self.number2 + self.number1;
        self.displayLabel.text = [NSString stringWithFormat:@"%g", result];
        
    }
    
    if ([self.sign isEqualToString:@"-"]) {
        
        
        float result = self.number2 - self.number1;
        self.displayLabel.text = [NSString stringWithFormat:@"%g", result];
        
    }
    
    if ([self.sign isEqualToString:@"x"]) {
        
        float result = self.number2 * self.number1;
        self.displayLabel.text = [NSString stringWithFormat:@"%g", result];
        
        
    }
    
    if ([self.sign isEqualToString:@"/"]) {
        float result = self.number2 / self.number1;
        self.displayLabel.text = [NSString stringWithFormat:@"%g", result];
    
    }
    
    self.cal = YES;
    
}


#pragma mark - 运算符按键
- (void)calAction:(UIButton *)calButton
{
    
    self.displayLabel.text = @"";
    
    self.displayLabel.text = calButton.currentTitle;
    
    self.sign = calButton.currentTitle;
    
    self.number2 = self.number1;
    
}







#pragma mark - 其它
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
