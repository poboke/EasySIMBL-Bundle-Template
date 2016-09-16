//
//  MQAIOChatTootKitViewController+SendPicture.m
//  QQPlugin
//
//  Created by Jobs on 16/9/1.
//  Copyright © 2016年 Jobs. All rights reserved.
//

#import "MQAIOChatTootKitViewController+SendPicture.h"

@implementation NSObject (MQAIOChatTootKitViewControllerSendPicture)

+ (void)sendPicture_MQAIOChatTootKitViewController
{
    [self jr_swizzleMethod:@selector(setupUI:)
                withMethod:@selector(sendPicture_setupUI:)
                     error:NULL];
}

- (void)sendPicture_setupUI:(int)arg1
{
    [self sendPicture_setupUI:arg1];
    
    MQAIOChatTootKitViewController *vc = (MQAIOChatTootKitViewController *)self;
    
    NSInteger buttonCount = vc.view.subviews.count;
    
    NSButton *pictureBtn = (NSButton *)vc.pictureBtn;
    [vc.view addSubview:pictureBtn];
    
    NSDictionary *metrics = @{
        @"left" : @(20 + buttonCount * 40),
        @"top"  : @(10),
    };
    NSDictionary *views = NSDictionaryOfVariableBindings(pictureBtn);
    
    [vc.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[pictureBtn]"
                                                                    options:0
                                                                    metrics:metrics
                                                                      views:views]];
    [vc.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-top-[pictureBtn]"
                                                                    options:0
                                                                    metrics:metrics
                                                                      views:views]];
}

@end
