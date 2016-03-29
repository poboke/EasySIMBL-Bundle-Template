//
//  WifiMasterKeyPlugin.m
//  WifiMasterKeyPlugin
//
//  Created by Jobs on 16/2/4.
//  Copyright © 2016年 Jobs. All rights reserved.
//

#import "WifiMasterKeyPlugin.h"
#import "WiFiKeyAESUtilties+Hook.h"

@interface WifiMasterKeyPlugin()

@end


@implementation WifiMasterKeyPlugin

/**
 * @return the single static instance of the plugin object
 */
+ (instancetype)sharedInstance
{
    static WifiMasterKeyPlugin *plugin = nil;
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
    WifiMasterKeyPlugin *plugin = [WifiMasterKeyPlugin sharedInstance];
    NSLog(@"++++++++ %@ plugin loaded ++++++++", plugin);
    
    [NSClassFromString(@"WiFiKeyAESUtilties") hook_WiFiKeyAESUtilties];
}

@end
