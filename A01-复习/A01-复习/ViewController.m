//
//  ViewController.m
//  A01-复习
//
//  Created by Apple on 14/12/12.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZPerson.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // control + command + j
    CZPerson *p1 = [[CZPerson alloc] initWithName:@"德山" age:-18];
    
    CZPerson *p2 =[CZPerson personWithName:@"房事疼" age:19];
    
    
    NSLog(@"%d",p1.age);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
