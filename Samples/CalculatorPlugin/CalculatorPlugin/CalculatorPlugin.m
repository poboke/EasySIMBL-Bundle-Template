//
//  CalculatorPlugin.m
//  CalculatorPlugin
//
//  Created by Jobs on 16/2/14.
//  Copyright (c) 2015年 Jobs. All rights reserved.
//

#import "CalculatorPlugin.h"
#import "CalculatorController+Hook.h"

@interface CalculatorPlugin()

@end


@implementation CalculatorPlugin

/**
 * @return the single static instance of the plugin object
 */
+ (instancetype)sharedInstance
{
    static CalculatorPlugin *plugin = nil;
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
    CalculatorPlugin *plugin = [CalculatorPlugin sharedInstance];
    NSLog(@"++++++++ %@ plugin loaded ++++++++", plugin);
    
    [NSClassFromString(@"CalculatorController") hook_CalculatorController];
}


@end
