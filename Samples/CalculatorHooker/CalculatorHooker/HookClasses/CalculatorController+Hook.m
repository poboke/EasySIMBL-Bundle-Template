//
//  CalculatorController+Hook.m
//  HookCalculator
//
//  Created by Jobs on 16/2/14.
//  Copyright (c) 2015年 Jobs. All rights reserved.
//

#import "CalculatorController+Hook.h"

@implementation NSObject (CalculatorControllerHook)

+ (void)hook_CalculatorController
{
    [self jr_swizzleMethod:@selector(showAbout:)
                withMethod:@selector(hook_showAbout:)
                     error:nil];
}


- (void)hook_showAbout:(id)sender
{
    NSAlert *alert = [[NSAlert alloc] init];
    alert.messageText = @"Hello world!";
    [alert runModal];
    
    [self hook_showAbout:sender];
}

@end
