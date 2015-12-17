//
//  CZAppInfoView.m
//  A02-应用管理
//
//  Created by Apple on 14/12/12.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZAppInfoView.h"
#import "CZAppInfo.h"
@interface CZAppInfoView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameView;

- (IBAction)downloadClick:(UIButton *)sender;

@end

@implementation CZAppInfoView
+ (instancetype)appInfoView
{
    //从xib中加载subview
    NSBundle *bundle = [NSBundle mainBundle];
    //加载xib中得view
    CZAppInfoView *subView = [[bundle loadNibNamed:@"CZAppInfoView" owner:nil options:nil] lastObject];
    
    //加载xml
//    CZAppInfoView *v = [[CZAppInfoView alloc] init];
//    v.frame
    
    
    
    return subView;
}

/**
 *  重写属性的setter方法，给子控件赋值
 *
 *  @param appInfo appInfo description
 */
- (void)setAppInfo:(CZAppInfo *)appInfo
{
    _appInfo = appInfo;
    
    self.nameView.text = appInfo.name;
    self.iconView.image = [UIImage imageNamed:appInfo.icon];
}


//- (void)setData
//{
//        self.nameView.text = self.appInfo.name;
//        self.iconView.image = [UIImage imageNamed:self.appInfo.icon];
//    
//}


- (IBAction)downloadClick:(UIButton *)sender {
    
    //取消和用户的交互
    self.superview.userInteractionEnabled = NO;
    
    sender.enabled = NO;
    
    //提示正在下载
    UILabel *tipView = [[UILabel alloc] init];
    //self(自定义view).superview（控制器的根view）
    [self.superview addSubview:tipView];

    tipView.text = [NSString stringWithFormat:@"正在下载:%@",self.appInfo.name];
    
    //frame
    CGFloat tipW = 200;
    CGFloat tipH = 25;
    CGFloat tipX = (self.superview.frame.size.width - tipW) / 2;
    CGFloat tipY = (self.superview.frame.size.height - tipH) / 2;
    tipView.frame = CGRectMake(tipX, tipY, tipW, tipH);
    
    tipView.backgroundColor = [UIColor grayColor];
    tipView.textAlignment = NSTextAlignmentCenter;
    
    //透明度
    tipView.alpha = 0;
    //圆角
    tipView.layer.cornerRadius = 5;
    tipView.layer.masksToBounds = YES; //剪裁超过bounds的部分
    
    //动画效果
    [UIView animateWithDuration:1.0 animations:^{
        tipView.alpha = 0.9;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 delay:3.0 options:UIViewAnimationOptionCurveLinear animations:^{
            tipView.alpha = 0;
            
        } completion:^(BOOL finished) {
            //从父view中移除
            [tipView removeFromSuperview];
            
            //
            self.superview.userInteractionEnabled = YES;
        }];

    }];
    
}
@end
