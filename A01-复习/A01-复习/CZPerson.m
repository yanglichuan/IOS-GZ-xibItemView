//
//  CZPerson.m
//  A01-复习
//
//  Created by Apple on 14/12/12.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZPerson.h"

@implementation CZPerson



- (instancetype)initWithName:(NSString *)name age:(int)age
{
    if (self = [super init]) {
        self.name = name;
        self.age = age;
    }
    return self;
}
+ (instancetype)personWithName:(NSString *)name age:(int)age
{
    
    return [[self alloc] initWithName:name age:age];
}


- (void)setAge:(int)age
{
    if (age >= 18 && age <= 80) {
        _age = age;
    }else{
        _age = 18;
    }
    
    
}


@end
