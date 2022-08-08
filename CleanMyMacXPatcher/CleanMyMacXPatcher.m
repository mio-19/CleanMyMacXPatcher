//
//  CleanMyMacXPatcher.m
//  CleanMyMacXPatcher
//
//  Created by user on 8/8/22.
//

#import "CleanMyMacXPatcher.h"
#import <objc/runtime.h>

@implementation CleanMyMacXPatcher

-(BOOL)isAppActivated{
    return true;
}

+(void)load{
    NSLog(@"-- Clean My Mac Patcher loading ...");
    Method origMethod = class_getInstanceMethod(NSClassFromString(@"CMMacPawAccountActivationManager"), NSSelectorFromString(@"isAppActivated"));
    Method newMethod = class_getInstanceMethod([CleanMyMacXPatcher class], @selector(isAppActivated));

    method_exchangeImplementations(origMethod, newMethod);
}

@end
