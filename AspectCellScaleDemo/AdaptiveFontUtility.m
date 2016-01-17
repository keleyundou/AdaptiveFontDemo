//
//  AdaptiveFontUtility.m
//  AspectCellScaleDemo
//
//  Created by 冰点 on 16/1/16.
//  Copyright © 2016年 冰点. All rights reserved.
//

#import "AdaptiveFontUtility.h"
#import <objc/runtime.h>

void bd_exchangeInstanceMethod(Class aClass, SEL oldSEL, SEL newSEL)
{
    Method oldMethod = class_getInstanceMethod(aClass, oldSEL);
    assert(oldMethod);
    Method newMethod = class_getInstanceMethod(aClass, newSEL);
    assert(newMethod);
    method_exchangeImplementations(oldMethod, newMethod);
}

void bd_exchageClassMethod(Class aClass, SEL oldSEL, SEL newSEL)
{
    Method oldClsMethod = class_getClassMethod(aClass, oldSEL);
    assert(oldClsMethod);
    Method newClsMethod = class_getClassMethod(aClass, newSEL);
    assert(newClsMethod);
    method_exchangeImplementations(oldClsMethod, newClsMethod);
}

@implementation AdaptiveFontUtility
@end
