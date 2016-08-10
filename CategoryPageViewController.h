//
//  CategoryPageViewController.h
//  ArtVRDemo
//
//  Created by Jack Liu on 6/11/16.
//  Copyright © 2016 Jack Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryPageViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *categoryTableView;

@end
