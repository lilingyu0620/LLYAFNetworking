//
//  LLYAAA.m
//  LLYAFNetworking
//
//  Created by lly on 2018/6/9.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "LLYAAA.h"
#import <objc/runtime.h>

@implementation LLYAAA

+ (void)printAllMethod{
    
    NSLog(@"______________________AAAAAAAAAAAAAAAAAAAAAAAAAAAA_______________________");
    unsigned int count;
    Method *methods = class_copyMethodList([self class], &count);
    for (int i = 0; i < count; i++)
    {
        Method method = methods[i];
        SEL selector = method_getName(method);
        IMP imp = method_getImplementation(method);
        NSString *name = NSStringFromSelector(selector);
        //        if ([name hasPrefix:@"test"])
        NSLog(@"SEL = %@\n",name);
    }
    
}

- (void)aaa_loveMe{
    
    NSLog(@"aaa_loveMe__%s",__func__);
}

- (void)aaa_hateMe{
    
    NSLog(@"aaa_hateMe__%s",__func__);
}

@end
