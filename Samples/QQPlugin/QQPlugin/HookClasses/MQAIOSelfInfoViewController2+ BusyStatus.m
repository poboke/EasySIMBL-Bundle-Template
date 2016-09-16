//
//  MQAIOSelfInfoViewController2+BusyStatus.m
//  QQPlugin
//
//  Created by Jobs on 16/9/1.
//  Copyright © 2016年 Jobs. All rights reserved.
//

#import "MQAIOSelfInfoViewController2+BusyStatus.h"

@implementation NSObject (MQAIOSelfInfoViewController2BusyStatus)

+ (void)busyStatus_MQAIOSelfInfoViewController2
{
    [self jr_swizzleMethod:@selector(viewDidLoad)
                withMethod:@selector(busyStatus_viewDidLoad)
                     error:NULL];
}

- (void)busyStatus_viewDidLoad
{
    [self busyStatus_viewDidLoad];
    
    NSPopUpButton *popUpButton = [self valueForKey:@"_statusPopUpButton"];
    for (NSMenuItem *menuItem in popUpButton.itemArray) {
        menuItem.hidden = NO;
    }
}

@end
