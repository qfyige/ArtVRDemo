//
//  ImageTableViewCell.h
//  ArtVRDemo
//
//  Created by Jack Liu on 6/16/16.
//  Copyright © 2016 Jack Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *leftImage;
@property (weak, nonatomic) IBOutlet UILabel *leftName;
@property (weak, nonatomic) IBOutlet UILabel *leftSecondName;
@property (weak, nonatomic) IBOutlet UIImageView *rightImage;
@property (weak, nonatomic) IBOutlet UILabel *rightName;
@property (weak, nonatomic) IBOutlet UILabel *rightSecondName;
@property (weak, nonatomic) IBOutlet UILabel *leftBadge;
@property (weak, nonatomic) IBOutlet UILabel *rightBadge;
@property (weak, nonatomic) IBOutlet UILabel *leftTime;
@property (weak, nonatomic) IBOutlet UILabel *rightTime;

@end
