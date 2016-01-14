//
//  Contact.m
//  UI12_MVC_model使用
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import "Contact.h"

@implementation C_ontact

/** 重写KVC中未识别key方法. */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

//    /** 活用: 1对多.假如 */
//    if ([key isEqualToString:@"title"]) {
//        self.name = value;
//    }

}

@end
