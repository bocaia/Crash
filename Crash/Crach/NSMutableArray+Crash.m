



//
//  NSMutableArray+Crash.m
//  Crash
//
//  Created by songqingbo on 2017/3/30.
//  Copyright © 2017年 songqingbo. All rights reserved.
//

#import "NSMutableArray+Crash.h"
#import "Crash.h"
@implementation NSMutableArray (Crash)

+ (void)SQBCrashChangeMethod{
    static dispatch_once_t onetoken;
    dispatch_once(&onetoken, ^{
        Class class = NSClassFromString(@"__NSArrayM");
        
        //objectAtIndex
        [Crash exchangeInstanceMethod:class Method1Sel:@selector(objectAtIndex:) Method2Sel:@selector(crashObjectAtIndex:)];
        
        //setObject:atIndexedSubscript:
        [Crash exchangeInstanceMethod:class Method1Sel:@selector(setObject:atIndexedSubscript:) Method2Sel:@selector(crashSetObject:atIndexedSubscript:)];
        
        //insertObject:atIndex:
        [Crash exchangeInstanceMethod:class Method1Sel:@selector(insertObject:atIndex:) Method2Sel:@selector(crashInsertObject:atIndex:)];
    });
}


//=================================================================
//                           objectAtIndex:
//=================================================================
#pragma mark - objectAtIndex:


- (id)crashObjectAtIndex:(NSUInteger)index{
    id object = nil;
    
    @try {
        object = [self crashObjectAtIndex:index];
    } @catch (NSException *exception) {
        DLog(@"%@",exception.description);
    } @finally {
        return object;
    }
}

//=================================================================
//                           setObject:atIndexedSubscript:
//=================================================================
#pragma mark - get object from array
- (void)crashSetObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    @try {
        [self crashSetObject:obj atIndexedSubscript:idx];
    } @catch (NSException *exception) {
        DLog(@"%@",exception.description);
    } @finally {
        
    }
}


//=================================================================
//                    insertObject:atIndex:
//=================================================================
#pragma mark - set方法
- (void)crashInsertObject:(id)anObject atIndex:(NSUInteger)index {
    
    @try {
        [self crashInsertObject:anObject atIndex:index];
    }
    @catch (NSException *exception) {
        DLog(@"%@",exception.description);
    }
    @finally {
        
    }
}

@end
