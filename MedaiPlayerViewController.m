//
//  MedaiPlayerViewController.m
//  MediaPlayer
//
//  Created by liujunfeng on 16/6/22.
//  Copyright (c) 2016年 liujunfeng. All rights reserved.
//

#import "MedaiPlayerViewController.h"

@interface MedaiPlayerViewController ()
{
    CGFloat y;
    CGFloat x;
}
@end

@implementation MedaiPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    x = (self.view.frame.size.width);
    y = (self.view.frame.size.height);
    
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建一个对象  获取到m4v文件的路径
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Children" ofType:@"m4v"];
    //看看路径
    NSLog(@"%@",path);
    
    //实例化 这个播放控制器    播放源 读取文件路径
    player  = [[MPMoviePlayerController alloc]initWithContentURL:[NSURL fileURLWithPath:path]];
    
    //设置事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MovieFinishedCallback:) name:@"MPMoviePlayerPlaybackDidFinishNotification" object:player];
    
    
    //控制器类型
    player.controlStyle = MPMovieControlStyleFullscreen;
    
    player.view.frame =CGRectMake(0, 0, x, y);
    
    [self.view addSubview:player.view];
    
    [player play];
    
    
}
-(void)MovieFinishedCallback:(NSNotification *)aNotification{
        NSLog(@"movieFinished");
        MPMoviePlayerController *play = (MPMoviePlayerController *)[aNotification object];
    
       [[NSNotificationCenter defaultCenter]removeObserver:self name:@"MPMoviePlayerPlaybackDidFinishNotification" object:play];
    
       [play stop];
    
        [play.view removeFromSuperview];
        [self dismissModalViewControllerAnimated:YES];
    
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
