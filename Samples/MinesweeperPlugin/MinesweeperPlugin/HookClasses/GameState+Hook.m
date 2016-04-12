//
//  GameState+Hook.m
//  MinesweeperPlugin
//
//  Created by Jobs on 16/4/6.
//  Copyright © 2016年 Jobs. All rights reserved.
//

#import "GameState+Hook.h"

@implementation NSObject (GameStateHook)

+ (void)hook_GameState
{
    [self jr_swizzleMethod:@selector(fullgame)
                withMethod:@selector(hook_fullgame)
                     error:nil];
    [self jr_swizzleMethod:@selector(robot)
                withMethod:@selector(hook_robot)
                     error:nil];
}


- (BOOL)hook_fullgame
{
    return YES;
}


- (int)hook_robot
{
    return 999;
}

@end
