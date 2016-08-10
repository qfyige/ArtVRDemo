//
//  MyPageDetailTableViewCell.h
//  ArtVRDemo
//
//  Created by Jack Liu on 6/30/16.
//  Copyright © 2016 Jack Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPageDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *categroyName;
@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *moreImage;

@property (strong,nonatomic) NSDictionary *data;

@end
