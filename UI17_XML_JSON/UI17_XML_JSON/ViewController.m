//
//  ViewController.m
//  UI17_XML_JSON
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "ParserSAX.h"
#import "ModelForStudent.h"
#import "ParserDOM.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

#pragma mark - 知识点1:XML SAX解析
- (IBAction)handleSAX:(id)sender {
    
    ParserSAX *parser = [[ParserSAX alloc]init];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Student" ofType:@"xml"];
    
    NSArray *arr = [parser parserSAXWithFile:path];
    NSLog(@"%@",arr);
    
    // 遍历数组,输出.
    for (ModelForStudent *stu in arr) {
        NSLog(@"name:%@",stu.name);
    }
}

#pragma mark - 知识点2:XML DOM解析
- (IBAction)handleDOM:(id)sender {

    ParserDOM *domPar = [[ParserDOM alloc]init];

    NSString *path = [[NSBundle mainBundle]pathForResource:@"Student" ofType:@"xml"];
    NSArray *arr = [domPar parserDOMWithFile:path];
    NSLog(@"%@",arr);

    for (ModelForStudent *stu in arr) {
        NSLog(@"%@",stu.name);
    }
}


#pragma mark - 知识点3: JSON解析
- (IBAction)handleJSON:(id)sender {
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"activitylist" ofType:@"txt"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"result:%@",result);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
