//
//  MyPageViewController.m
//  ArtVRDemo
//
//  Created by Jack Liu on 6/11/16.
//  Copyright © 2016 Jack Liu. All rights reserved.
//

#import "MyPageViewController.h"
#import "MypageDetailViewController.h"
@interface MyPageViewController()
{
    NSArray *dataSource;
}
@end

@implementation MyPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //header view
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 90)];
    imageView.userInteractionEnabled = YES;
    imageView.image=[UIImage imageNamed:@"settingheader.png"];
    UIButton *myselfButton = [UIButton buttonWithType:UIButtonTypeCustom];
    myselfButton.frame = CGRectMake(18, 18, 40, 40);
    //UIButton *myselfButton = [[UIButton alloc] initWithFrame:CGRectMake(18, 18, 40, 40)];
//    myselfButton.backgroundColor = [UIColor redColor];
//    [myselfButton setTitle:@"我" forState:UIControlStateNormal];
    [myselfButton setImage:[UIImage imageNamed:@"role-3"] forState:UIControlStateNormal];
    [myselfButton addTarget:self action:@selector(popEditPageController:) forControlEvents:UIControlEventTouchUpInside];
    
    [imageView addSubview:myselfButton];
    self.myTableView.tableHeaderView=imageView;
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    
}

- (void)popEditPageController:(UIButton *)sender
{
    MypageDetailViewController *detail = [[MypageDetailViewController alloc] initWithNibName:@"MypageDetailViewController" bundle:[NSBundle mainBundle]];
    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
    
    NSLog(@"aaa");
}

- (void)viewWillAppear:(BOOL)animated{
    //set up TabBar color
    //UITabBar *tabBar = [self.tabBarController tabBar];
    //[tabBar setBarTintColor:[UIColor colorWithRed:0/255.0 green:187/255.0 blue:239/255.0 alpha:1]];
    //[tabBar setTintColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //分组数 也就是section数
    return 3;
}

//设置每个分组下tableview的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 3;
    }else if (section==1) {
        return 2;
    }else{
        return 1;
    }
}
//每个分组上边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 1;
}
//每个分组下边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
//每一个分组下对应的tableview 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
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
        if (indexPath.row == 0){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userinfo"];
        
            UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(30, 8, 30, 30)];
            imageView.image=[UIImage imageNamed:@"icon_Historyicon_30_30.png"];
            [cell.contentView addSubview:imageView];
        
            UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(75, 18, 70, 20)];
            nameLabel.text=@"浏览历史";
            nameLabel.font = [UIFont systemFontOfSize:14];
            [cell.contentView addSubview:nameLabel];
        } else if (indexPath.row == 1) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userinfo"];
            
            UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(30, 8, 30, 30)];
            imageView.image=[UIImage imageNamed:@"icon_favoritesicon_30_30.png"];
            [cell.contentView addSubview:imageView];
            
            UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(75, 18, 70, 20)];
            nameLabel.text=@"我的收藏";
            nameLabel.font = [UIFont systemFontOfSize:14];
            [cell.contentView addSubview:nameLabel];
            
        } else if (indexPath.row == 2) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userinfo"];
            
            UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(30, 8, 30, 30)];
            imageView.image=[UIImage imageNamed:@"icon_points_30_30.png"];
            [cell.contentView addSubview:imageView];
            
            UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(75, 18, 70, 20)];
            nameLabel.text=@"我的积分";
            nameLabel.font = [UIFont systemFontOfSize:14];
            [cell.contentView addSubview:nameLabel];
            
        }
    }else if (indexPath.section==1) {
        if (indexPath.row == 0){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userinfo"];
            
            UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(30, 8, 30, 30)];
            imageView.image=[UIImage imageNamed:@"icon_levels_30_30.png"];
            [cell.contentView addSubview:imageView];
            
            UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(75, 18, 70, 20)];
            nameLabel.text=@"会员等级";
            nameLabel.font = [UIFont systemFontOfSize:14];
            [cell.contentView addSubview:nameLabel];
        } else if (indexPath.row == 1) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userinfo"];
            
            UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(30, 8, 30, 30)];
            imageView.image=[UIImage imageNamed:@"icon_purchase_30_30.png"];
            [cell.contentView addSubview:imageView];
            
            UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(75, 18, 70, 20)];
            nameLabel.text=@"购买记录";
            nameLabel.font = [UIFont systemFontOfSize:14];
            [cell.contentView addSubview:nameLabel];
            
        }
    }else if (indexPath.section==2){
        if (indexPath.row == 0){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userinfo"];
            
            UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(30, 8, 30, 30)];
            imageView.image=[UIImage imageNamed:@"icon_settings_30_30.png"];
            [cell.contentView addSubview:imageView];
            
            UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(75, 18, 70, 20)];
            nameLabel.text=@"设置";
            nameLabel.font = [UIFont systemFontOfSize:14];
            [cell.contentView addSubview:nameLabel];
        }
    }
    return cell;
}

@end
