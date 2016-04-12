//
//  MinesweeperPlugin.m
//  MinesweeperPlugin
//
//  Created by Jobs on 16/4/6.
//  Copyright © 2016年 Jobs. All rights reserved.
//

#import "MinesweeperPlugin.h"
#import "GameState+Hook.h"

@interface MinesweeperPlugin()

@end


@implementation MinesweeperPlugin

/**
 * @return the single static instance of the plugin object
 */
+ (instancetype)sharedInstance
{
    static MinesweeperPlugin *plugin = nil;
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
    MinesweeperPlugin *plugin = [MinesweeperPlugin sharedInstance];
    NSLog(@"++++++++ %@ plugin loaded ++++++++", plugin);
    
    [NSClassFromString(@"GameState") hook_GameState];
}


@end
