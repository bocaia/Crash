


//
//  Crash.m
//  Crash
//
//  Created by songqingbo on 2017/3/30.
//  Copyright © 2017年 songqingbo. All rights reserved.
//

#import "Crash.h"
#import <objc/runtime.h>
@implementation Crash

/**
 *  开始生效(进行方法的交换)
 */
+ (void)becomeEffective {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        [NSDictionary SQBCrshDictChangeMethod];
        [NSMutableArray SQBCrashChangeMethod];
    });
}


/**
 *  类方法的交换
 *
 *  @param anClass    哪个类
 *  @param method1Sel 方法1
 *  @param method2Sel 方法2
 */
+ (void)exchangeClassMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel {
    Method method1 = class_getClassMethod(anClass, method1Sel);
    Method method2 = class_getClassMethod(anClass, method2Sel);
    method_exchangeImplementations(method1, method2);
}

/*
 *  @param nClass       类
 *  @param method1Sel   方法(原本的方法)
 *  @param method2Sel   方法2（交换的方法）
 */
+(void)exchangeInstanceMethod:(Class)nClass Method1Sel:(SEL)method1Sel  Method2Sel:(SEL)method2Sel{
    
    Method orginalMethod = class_getInstanceMethod(nClass, method1Sel);
    Method swizzleMethod = class_getInstanceMethod(nClass, method2Sel);
    
    BOOL addMethod = class_addMethod(nClass, method1Sel, method_getImplementation(swizzleMethod),method_getTypeEncoding(swizzleMethod));
    
    if (addMethod) {
        class_replaceMethod(nClass, method2Sel, method_getImplementation(orginalMethod), method_getTypeEncoding(orginalMethod));
    }else{
        method_exchangeImplementations(orginalMethod, swizzleMethod);
    }
}

@end
