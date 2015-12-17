//
//  ViewController.m
//  A02-应用管理
//
//  Created by Apple on 14/12/12.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//存储从plist中获取的数据
@property (nonatomic, strong) NSArray *appInfos;
@end

@implementation ViewController

//1 懒加载
- (NSArray *)appInfos
{
    if (_appInfos == nil) {
        //1.1 bundle
        NSBundle *bundle = [NSBundle mainBundle];
        //1.2 获取plist的路径
        NSString *path = [bundle pathForResource:@"app" ofType:@"plist"];
        //1.3 加载plist
        _appInfos = [NSArray arrayWithContentsOfFile:path];
    }
    return _appInfos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSLog(@"%@",NSHomeDirectory());
    
    //2 测试数据
//    NSLog(@"%@",self.appInfos);
    
    
    CGFloat subViewW = 100;
    CGFloat subViewH = 100;
    //        子view的横向间距  =  (父view的宽度- 3 * 子view的宽度) / 4
    CGFloat marginX = (self.view.frame.size.width - 3 * subViewW) / 4;
    //        子view的纵向间距 =  20
    CGFloat marginY = 20;
    
    //3 动态生成9宫格的方块
    for (int i = 0; i < self.appInfos.count; i++) {
        //动态生成view
        UIView *subView = [[UIView alloc] init];
        [self.view addSubview:subView];
        
        //计算frame
      
//        当前子view的行号 = 当前遍历到得索引值 / 总列数
        int row = i / 3;
//        当前子view的列号 = 当前遍历到得索引值 % 总列数
        int column = i % 3;
//        
//        子view横坐标的公式 =  子view的横向间距  +  列号 * (子view的横向间距+ 子view的宽度)
        CGFloat subViewX = marginX + column * (marginX + subViewW);
//        子view纵坐标的公式 = 20 + 行号 * (子view的纵向间距+ 子view的高度)
        CGFloat subViewY = 30 + row * (marginY + subViewH);
        
        subView.frame = CGRectMake(subViewX, subViewY, subViewW, subViewH);

//        subView.backgroundColor = [UIColor redColor];
        
        
        //取得当前遍历到得数据
        NSDictionary *appInfo = self.appInfos[i];
        
//        appInfo[@"name"]
//        appInfo[@"icon"];
        
        
        [self displayAppInfo:appInfo subView:subView];
        
    }
}

//方法的功能 生成三个子控件，显示应用信息
//方法的返回值
//方法的参数
//方法内部的代码
- (void)displayAppInfo:(NSDictionary *)appInfo subView:(UIView *)subView
{
    CGFloat subViewW = subView.frame.size.width;
    //4 生成3个子控件
    //4.1 iconView
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:appInfo[@"icon"]]];
    [subView addSubview:iconView];
    //计算frame
    CGFloat iconW = 60;
    CGFloat iconH = 60;
    CGFloat iconY = 0;
    CGFloat iconX = (subViewW - iconW) / 2;
    iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    //4.2 nameView
    UILabel *nameView = [[UILabel alloc] init];
    [subView addSubview:nameView];
    
    //计算frame
    CGFloat nameW = subViewW;
    CGFloat nameH = 20;
    CGFloat nameX = 0;
    CGFloat nameY = iconH;
    nameView.frame = CGRectMake(nameX, nameY, nameW, nameH);
    //
    nameView.text = appInfo[@"name"];
    //文字大小
    nameView.font = [UIFont systemFontOfSize:15];
    //文字居中
    nameView.textAlignment = NSTextAlignmentCenter;
    //
    //        nameView.numberOfLines;
    
    //4.3 下载按钮
    UIButton *downloadView = [UIButton buttonWithType:UIButtonTypeCustom];
    [subView addSubview:downloadView];
    //计算frame
    CGFloat downloadW = iconW;
    CGFloat downloadH = 20;
    CGFloat downloadX = iconX;
    //获得label的最大y值
    CGFloat downloadY = CGRectGetMaxY(nameView.frame);
    downloadView.frame = CGRectMake(downloadX, downloadY, downloadW, downloadH);
    
    [downloadView setTitle:@"下载" forState:UIControlStateNormal];
    
    [downloadView setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
    [downloadView setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
    //设置按钮文字的大小
    downloadView.titleLabel.font = [UIFont systemFontOfSize:15];
    //给按钮注册事件
    [downloadView addTarget:self action:@selector(downloadClick) forControlEvents:UIControlEventTouchUpInside];
    
//    downloadView.tag = i;
}

- (void)downloadClick
{
    NSLog(@"==");
}
@end
