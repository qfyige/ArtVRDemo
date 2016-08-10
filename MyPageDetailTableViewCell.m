//
//  MyPageDetailTableViewCell.m
//  ArtVRDemo
//
//  Created by Jack Liu on 6/30/16.
//  Copyright © 2016 Jack Liu. All rights reserved.
//

#import "MyPageDetailTableViewCell.h"

@implementation MyPageDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setData:(NSDictionary *)data{
    NSString *name = [data objectForKey:@"title"];
    self.categroyName.text = name;
    self.detailLabel.text = [data objectForKey:@"detail"];
    NSString *image = [data objectForKey:@"image"];
    if(image){
        self.showImage.image = [UIImage imageNamed:image];
        self.detailLabel.hidden = YES;
        self.moreImage.hidden = YES;
    }else{
        self.showImage.hidden = YES;
        self.detailLabel.hidden = NO;
        self.moreImage.hidden = NO;
    }
    
}


@end
