//
//  LoginHelper.m
//  ArtVRDemo
//
//  Created by Jack Liu on 6/30/16.
//  Copyright © 2016 Jack Liu. All rights reserved.
//

#import "LoginHelper.h"

@implementation LoginHelper
static bool isLogin = NO;

+ (BOOL)isLogin{
    
    //NSNumber *loginStatus = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginStatus"];
    //return [loginStatus boolValue];
    return  isLogin;
}

+ (void)logIn{
    isLogin = YES;
    //[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"loginStatus"];
}

+ (void)logOut{
    isLogin = NO;
    //[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO] forKey:@"loginStatus"];
}

@end
