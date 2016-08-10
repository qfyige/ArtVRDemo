//
//  TabBarController.m
//  ArtVRDemo
//
//  Created by Jack Liu on 6/13/16.
//  Copyright © 2016 Jack Liu. All rights reserved.
//

#import "TabBarController.h"
#import "LoginHelper.h"
#import "LoginViewController.h"
@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if(![LoginHelper isLogin]){
        LoginViewController *login = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
        [self presentViewController:login animated:YES completion:^{
            
        }];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSLog(@"selectedindex: %lu",(unsigned long)self.selectedIndex);
}


@end
