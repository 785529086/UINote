//
//  Contact.h
//  UI12_MVC_model使用
//
//  Created by dllo on 15/12/28.
//  Copyright © 2015年 lanou.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface C_ontact : NSObject

/** 声明属性, 一般是在数据字典中需要的数据对应的Key值. */
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *hobby;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, copy) NSString *phone;

@end
