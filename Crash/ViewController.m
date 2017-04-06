//
//  ViewController.m
//  Crash
//
//  Created by songqingbo on 2017/3/30.
//  Copyright © 2017年 songqingbo. All rights reserved.
//

#import "ViewController.h"
#import "Crash.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self crashNSMutArrayTest];
    [self crashNSMutArraySetObjectTest];
    [self crashInsertObjectNSMutArrayTest];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark --NSMutArray
- (void)crashNSMutArrayTest{
    NSMutableArray *array = @[@"changee"].mutableCopy;
//    NSString *str = array[2];
    NSString *str = [array objectAtIndex:2];
    DLog(@"object = %@",str);
}

- (void)crashNSMutArraySetObjectTest{
    NSMutableArray *array = @[@"songqingbo"].mutableCopy;
    array[3] = @"iOS";
}

- (void)crashInsertObjectNSMutArrayTest{
    NSMutableArray *array = @[@"songqingbo"].mutableCopy;
    [array insertObject:@"adsd" atIndex:4];
}


@end
