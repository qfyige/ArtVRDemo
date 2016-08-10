//
//  VideoDetailViewController.h
//  ArtVRDemo
//
//  Created by Jack Liu on 6/12/16.
//  Copyright © 2016 Jack Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface VideoDetailViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,AVPlayerViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UITableView *recommendTableView;
- (IBAction)play:(id)sender;

@end
