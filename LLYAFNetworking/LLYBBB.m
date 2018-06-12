//
//  LLYBBB.m
//  LLYAFNetworking
//
//  Created by lly on 2018/6/9.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "LLYBBB.h"
#import "LLYAAA.h"
#import <objc/runtime.h>

@implementation LLYBBB

+ (void)load{
    
    [self swizzleResumeAndSuspendMethodForClass:[LLYAAA class]];
}

static inline void af_swizzleSelector(Class theClass, SEL originalSelector,Class selfClass, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(theClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(selfClass, swizzledSelector);
    method_exchangeImplementations(originalMethod, swizzledMethod);
}


static inline BOOL af_addMethod(Class theClass, SEL selector, Method method) {
    BOOL bRet = class_addMethod(theClass, selector,  method_getImplementation(method),  method_getTypeEncoding(method));
    return bRet;
}

+ (void)swizzleResumeAndSuspendMethodForClass:(Class)theClass {
//    Method afResumeMethod = class_getInstanceMethod(self, @selector(bbb_loveMe));
//    Method afSuspendMethod = class_getInstanceMethod(self, @selector(bbb_hateMe));
//
//    if (af_addMethod(theClass, @selector(bbb_loveMe), afResumeMethod)) {
//        af_swizzleSelector(theClass, @selector(aaa_loveMe), @selector(bbb_loveMe));
//    }
//    if (af_addMethod(theClass, @selector(bbb_hateMe), afSuspendMethod)) {
//        af_swizzleSelector(theClass, @selector(aaa_hateMe), @selector(bbb_hateMe));
//    }
    
    af_swizzleSelector(theClass, @selector(aaa_loveMe),self, @selector(bbb_loveMe));
    af_swizzleSelector(theClass, @selector(aaa_hateMe),self, @selector(bbb_hateMe));
}


+ (void)printAllMethod{
    
    NSLog(@"______________________BBBBBBBBBBBBBBBBBBBBBBBBBBB_______________________");
    unsigned int count;
    Method *methods = class_copyMethodList([self class], &count);
    for (int i = 0; i < count; i++)
    {
        Method method = methods[i];
        SEL selector = method_getName(method);
        NSString *name = NSStringFromSelector(selector);
        //        if ([name hasPrefix:@"test"])
        NSLog(@"SEL = %@\n",name);
    }
    
}

- (void)bbb_loveMe{
    
    NSLog(@"bbb_loveMe__%s",__func__);
}

- (void)bbb_hateMe{
    
    NSLog(@"bbb_hateMe__%s",__func__);
}

@end
