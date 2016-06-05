//
//  WiFiKeyAESUtilties+Hook.m
//  WifiMasterKeyPlugin
//
//  Created by Jobs on 16/2/4.
//  Copyright © 2016年 Jobs. All rights reserved.
//

#import "WiFiKeyAESUtilties+Hook.h"

@implementation NSObject (WiFiKeyAESUtiltiesHook)

+ (void)hook_WiFiKeyAESUtilties
{
    [self jr_swizzleClassMethod:@selector(ShareKeyAES128Decry:)
                withClassMethod:@selector(hook_ShareKeyAES128Decry:)
                     error:NULL];
}


+ (id)hook_ShareKeyAES128Decry:(id)arg1
{
    NSString *shareKey = [self hook_ShareKeyAES128Decry:arg1];
    shareKey = [shareKey stringByRemovingPercentEncoding];
    
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSInformationalAlertStyle;
    alert.messageText = @"密码：";
    alert.informativeText = shareKey;
    [alert runModal];
    
    return shareKey;
}

@end
