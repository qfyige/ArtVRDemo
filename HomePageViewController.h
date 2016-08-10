//
//  HomePageViewController.h
//  ArtVRDemo
//
//  Created by Jack Liu on 6/11/16.
//  Copyright © 2016 Jack Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *homeTableView;

@end
