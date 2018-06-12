//
//  ViewController.m
//  LLYAFNetworking
//
//  Created by lly on 2018/6/8.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "ViewController.h"
#import "LLYAAA.h"
#import "LLYBBB.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [LLYAAA printAllMethod];
    [LLYBBB printAllMethod];
    
    LLYAAA *aaa = [LLYAAA new];
    [aaa aaa_hateMe];
    [aaa aaa_loveMe];
    LLYBBB *bbb = [LLYBBB new];
    [bbb bbb_hateMe];
    [bbb bbb_loveMe];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
