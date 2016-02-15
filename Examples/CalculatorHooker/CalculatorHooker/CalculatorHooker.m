//
//  CalculatorHooker.m
//  CalculatorHooker
//
//  Created by Jobs on 16/2/14.
//  Copyright (c) 2015年 Jobs. All rights reserved.
//

#import "CalculatorHooker.h"
#import "CalculatorController+Hook.h"

@interface CalculatorHooker()

@end


@implementation CalculatorHooker

/**
 * @return the single static instance of the plugin object
 */
+ (instancetype)sharedInstance
{
    static CalculatorHooker *plugin = nil;
    @synchronized(self) {
        if (!plugin) {
            plugin = [[self alloc] init];
        }
    }
    return plugin;
}


/**
 * A special method called by SIMBL once the application has started and all classes are initialized.
 */
+ (void)load
{
    CalculatorHooker *plugin = [CalculatorHooker sharedInstance];
    NSLog(@"++++++++ %@ plugin loaded ++++++++", plugin);
    
    [NSClassFromString(@"CalculatorController") hook_CalculatorController];
}


@end
