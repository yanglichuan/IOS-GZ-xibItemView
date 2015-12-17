//
//  CZAppInfo.m
//  A02-应用管理
//
//  Created by Apple on 14/12/12.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZAppInfo.h"

@implementation CZAppInfo
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.name = dic[@"name"];
        self.icon = dic[@"icon"];
    }
    return self;
}
+ (instancetype)appInfoWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *)appInfosList
{
    //1.1 bundle
    NSBundle *bundle = [NSBundle mainBundle];
    //1.2 获取plist的路径
    NSString *path = [bundle pathForResource:@"app" ofType:@"plist"];
    //1.3 加载plist
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *tmpArray = [NSMutableArray array];
    //1.4 字典转换模型
    for (NSDictionary *dic in dicArray) {
        
        //调用appinfo的类方法
        CZAppInfo *appInfo = [CZAppInfo appInfoWithDic:dic];
        
        [tmpArray addObject:appInfo];
    }
    
    return tmpArray;
}
@end
