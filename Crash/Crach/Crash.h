//
//  Crash.h
//  Crash
//
//  Created by songqingbo on 2017/3/30.
//  Copyright © 2017年 songqingbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+Crash.h"
#import "NSDictionary+Carsh.h"

#ifdef DEBUG
# define DLog(format, ...) NSLog((@"[函数名:%s]" "[行号:%d]" format), __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DLog(...);
#endif

@interface Crash : NSObject

/**
 *  开始生效(进行方法的交换)
 */
+ (void)becomeEffective;
    
/**
 *  类方法的交换
 *
 *  @param anClass    哪个类
 *  @param method1Sel 方法1
 *  @param method2Sel 方法2
 */
+ (void)exchangeClassMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel;

/*
 *  @param nClass       类
 *  @param method1Sel   方法(原本的方法)
 *  @param method2Sel   方法2（交换的方法）
 */
+(void)exchangeInstanceMethod:(Class)nClass Method1Sel:(SEL)method1Sel  Method2Sel:(SEL)method2Sel;

@end
