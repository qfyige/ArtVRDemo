//
//  LoginHelper.h
//  ArtVRDemo
//
//  Created by Jack Liu on 6/30/16.
//  Copyright © 2016 Jack Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginHelper : NSObject
+ (BOOL)isLogin;
+ (void)logIn;
+ (void)logOut;

@end
