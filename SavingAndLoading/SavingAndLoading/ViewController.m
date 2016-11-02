//
//  ViewController.m
//  SavingAndLoading
//
//  Created by 来自遥远星系的核心巡洋舰 on 16/11/2.
//  Copyright © 2016年 KnightJoker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Events

- (void)initView {

    NSDictionary *dic = @{@"key":@"values",
                          @"key1":@"values2"};
    
    NSString *tempString = [dic objectForKey:@"key"];
}

@end
