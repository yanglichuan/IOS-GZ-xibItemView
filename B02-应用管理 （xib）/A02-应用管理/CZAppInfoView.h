//
//  CZAppInfoView.h
//  A02-应用管理
//
//  Created by Apple on 14/12/12.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZAppInfo;

@interface CZAppInfoView : UIView



@property (nonatomic, strong) CZAppInfo *appInfo;

+ (instancetype)appInfoView;

//- (void)setData;
@end
