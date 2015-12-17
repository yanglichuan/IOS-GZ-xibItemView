//
//  CZPerson.h
//  A01-复习
//
//  Created by Apple on 14/12/12.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZPerson : NSObject
//属性  封装 成员变量(字段)
@property (nonatomic,copy) NSString *name;
@property (nonatomic, assign) int age;

- (instancetype)initWithName:(NSString *)name age:(int)age;
+ (instancetype)personWithName:(NSString *)name age:(int)age;

@end
