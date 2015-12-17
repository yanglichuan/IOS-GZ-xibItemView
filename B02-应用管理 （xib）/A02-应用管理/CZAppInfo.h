//
//  CZAppInfo.h
//  A02-应用管理
//
//  Created by Apple on 14/12/12.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZAppInfo : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *icon;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)appInfoWithDic:(NSDictionary *)dic;


+ (NSArray *)appInfosList;
@end
