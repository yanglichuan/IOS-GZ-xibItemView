//
//  ViewController.m
//  A02-应用管理
//
//  Created by Apple on 14/12/12.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZAppInfo.h"
#import "CZAppInfoView.h"
@interface ViewController ()
//存储从plist中获取的数据
@property (nonatomic, strong) NSArray *appInfos;
@end

@implementation ViewController

//1 懒加载
- (NSArray *)appInfos
{
    if (_appInfos == nil) {
        //调用 appInfo的类方法，返回模型数组
        _appInfos = [CZAppInfo appInfosList];
    }
    return _appInfos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",NSHomeDirectory());
    
    //2 测试数据
//    NSLog(@"%@",self.appInfos);
    
    int totalColumn = 3;
    CGFloat subViewW = 100;
    CGFloat subViewH = 100;
    //        子view的横向间距  =  (父view的宽度- 3 * 子view的宽度) / 4
    CGFloat marginX = (self.view.frame.size.width - totalColumn * subViewW) / (totalColumn + 1);
    //        子view的纵向间距 =  20
    CGFloat marginY = 20;
    
    //3 动态生成9宫格的方块
    for (int i = 0; i < self.appInfos.count; i++) {
        //动态生成view
        
//        UIView *subView = [[UIView alloc] init];
//        [self.view addSubview:subView];
        
        
//        //从xib中加载subview
//        NSBundle *bundle = [NSBundle mainBundle];
//        //加载xib中得view
//        CZAppInfoView *subView = [[bundle loadNibNamed:@"CZAppInfoView" owner:nil options:nil] lastObject];
        
        
        
        //封装自定义view
        CZAppInfoView *subView = [CZAppInfoView appInfoView];
        
        [self.view addSubview:subView];
        
        //计算frame
      
//        当前子view的行号 = 当前遍历到得索引值 / 总列数
        int row = i / totalColumn;
//        当前子view的列号 = 当前遍历到得索引值 % 总列数
        int column = i % totalColumn;
//        
//        子view横坐标的公式 =  子view的横向间距  +  列号 * (子view的横向间距+ 子view的宽度)
        CGFloat subViewX = marginX + column * (marginX + subViewW);
//        子view纵坐标的公式 = 20 + 行号 * (子view的纵向间距+ 子view的高度)
        CGFloat subViewY = 30 + row * (marginY + subViewH);
        
        subView.frame = CGRectMake(subViewX, subViewY, subViewW, subViewH);


        //取得当前遍历到得数据
        CZAppInfo *appInfo = self.appInfos[i];
        
        //给subview的子控件赋值
//        //方式1
//        UIImageView *iconView = subView.subviews[0];
//        iconView.image = [UIImage imageNamed:appInfo.icon];
//       //方式2
//        UILabel *nameView =  (UILabel *)[subView viewWithTag:10];
//        nameView.text = appInfo.name;
        
        
//        subView.nameView.text = appInfo.name;
//        subView.iconView.image = [UIImage imageNamed:appInfo.icon];
    
        
        subView.appInfo = appInfo;

        
        
    }
}

@end
