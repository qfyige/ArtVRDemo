//
//  VideoDetailViewController.m
//  ArtVRDemo
//
//  Created by Jack Liu on 6/12/16.
//  Copyright © 2016 Jack Liu. All rights reserved.
//

#import "VideoDetailViewController.h"
#import <UIKit/UIKit.h>
#import "ImageTableViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "MedaiPlayerViewController.h"


#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define RightMargin 10

@interface VideoDetailViewController () {
    AVPlayer *_player; /**< 媒体播放器 */
    AVPlayerViewController *_playerViewController; /**< 媒体播放控制器 */
    
}

@end

@implementation VideoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.recommendTableView registerNib:[UINib nibWithNibName:@"RecommendVideoTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"RecommendVideoTableViewCell"];
    
    self.recommendTableView.delegate=self;
    self.recommendTableView.dataSource=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //分组数 也就是section数
    return 1;
}

//设置每个分组下tableview的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 3;
    } else {
        return 2;
    }
    
}
//每个分组上边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 20;
    } else {
        return 1;
    }
}
//每个分组下边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

// 创建一个组头每个组 可设置一个组头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //我会自定义个一个组头
    if (section == 0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
        view.backgroundColor = [UIColor whiteColor];
        UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ScreenWidth, 20)];
        leftLabel.text = @"为您推荐";
        leftLabel.font = [UIFont systemFontOfSize:14.0];
        UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-RightMargin-20, 0, 20, 20)];
        rightLabel.text = @" ";
        rightLabel.textAlignment = NSTextAlignmentRight;
        rightLabel.font = [UIFont systemFontOfSize:14.0];
        [view addSubview:leftLabel];
        [view addSubview:rightLabel];
        return view;
    } else {
        return nil;
    }
}


//每一个分组下对应的tableview 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 116;
    } else {
        return 0;
    }
}

//设置每行对应的cell（展示的内容）
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    
    if (indexPath.section==0) {
        ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecommendVideoTableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return cell;
}

//处理点击事件
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1 || indexPath.section == 2){
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        VideoDetailViewController *videoDetail = [storyboard instantiateViewControllerWithIdentifier:@"VideoDetailViewController"];
        [self.navigationController pushViewController:videoDetail animated:YES];
    }
    
}

- (IBAction)play:(id)sender {
    MedaiPlayerViewController *player = [[MedaiPlayerViewController alloc]init];
    [player setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentModalViewController:player animated:YES];
    /*
    NSURL *sourceMovieURL = [NSURL fileURLWithPath:filePath];
    
    AVAsset *movieAsset = [AVURLAsset URLAssetWithURL:sourceMovieURL options:nil];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:movieAsset];
    AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.frame = self.view.layer.bounds;
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    
    [self.view.layer addSublayer:playerLayer];
    [player play];
     */
}
@end
