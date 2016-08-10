//
//  MembersPageViewController.m
//  ArtVRDemo
//
//  Created by Jack Liu on 6/11/16.
//  Copyright © 2016 Jack Liu. All rights reserved.
//

#import "MembersPageViewController.h"
#import "ImageTableViewCell.h"
#import "VideoDetailViewController.h"

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define RightMargin 10

@implementation MembersPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.membersTableView registerNib:[UINib nibWithNibName:@"ImageTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ImageTableViewCell"];
    [self.membersTableView registerNib:[UINib nibWithNibName:@"HotTeachersTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"HotTeachersTableViewCell"];
    
    self.membersTableView.delegate=self;
    self.membersTableView.dataSource=self;
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    //set up TabBar color
    //UITabBar *tabBar = [self.tabBarController tabBar];
    //[tabBar setBarTintColor:[UIColor colorWithRed:93/255.0 green:191/255.0 blue:133/255.0 alpha:1]];
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
        return 1;
    } else if (section==1){
        return 2;
    } else if (section==2){
        return 2;
    } else {
        return 2;
    }
    
}
//每个分组上边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 20;
    } else if (section == 1) {
        return 20;
    } else if (section == 2) {
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
        leftLabel.text = @"我的老师";
        leftLabel.font = [UIFont systemFontOfSize:14.0];
        UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-RightMargin-20, 0, 20, 20)];
        rightLabel.text = @" ";
        rightLabel.textAlignment = NSTextAlignmentRight;
        rightLabel.font = [UIFont systemFontOfSize:14.0];
        [view addSubview:leftLabel];
        [view addSubview:rightLabel];
        return view;
    } else if (section == 1) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
        view.backgroundColor = [UIColor whiteColor];
        UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ScreenWidth, 20)];
        leftLabel.text = @"会员精选";
        leftLabel.font = [UIFont systemFontOfSize:14.0];
        UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-RightMargin-20, 0, 20, 20)];
        rightLabel.text = @">";
        rightLabel.textAlignment = NSTextAlignmentRight;
        rightLabel.font = [UIFont systemFontOfSize:14.0];
        [view addSubview:leftLabel];
        [view addSubview:rightLabel];
        return view;
    } else if (section == 2) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
        view.backgroundColor = [UIColor whiteColor];
        UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ScreenWidth, 20)];
        leftLabel.text = @"最新发布";
        leftLabel.font = [UIFont systemFontOfSize:14.0];
        UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-RightMargin-20, 0, 20, 20)];
        rightLabel.text = @">";
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
        return 65;
    } else if (indexPath.section == 1) {
        return 145;
    } else if (indexPath.section == 2) {
        return 145;
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
        if (indexPath.row == 0){
            ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotTeachersTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    } else if (indexPath.section==1) {
        if (indexPath.row == 0){
            ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftImage.image = [UIImage imageNamed:@"金秋古琴约知音 悠悠丝弦赏清心_陆海.png"];
            cell.leftName.text = @"金秋古琴约知音 悠悠丝弦赏清心";
            cell.leftSecondName.text = @"陆海 476 views 16 Hours";
            cell.leftTime.text = @"01:56";
            cell.leftBadge.backgroundColor = [UIColor colorWithRed:247/255.0 green:173/255.0 blue:46/255.0 alpha:1];
            cell.leftBadge.text = @"会员";
            cell.rightImage.image = [UIImage imageNamed:@"零基础 学吉他 高效率 时间短见效快_黄志鹏.png"];
            cell.rightName.text = @"零基础 学吉他 高效率 时间短见效快";
            cell.rightSecondName.text = @"黄志鹏 476 views 16 Hours";
            cell.rightTime.text = @"04:56";
            cell.rightBadge.backgroundColor = [UIColor colorWithRed:247/255.0 green:173/255.0 blue:46/255.0 alpha:1];
            cell.rightBadge.text = @"会员";
            return cell;
        } else if (indexPath.row == 1){
            ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftImage.image = [UIImage imageNamed:@"古筝入门系列体验课程_宋浩源.png"];
            cell.leftName.text = @"古筝入门系列体验课程";
            cell.leftSecondName.text = @"宋浩源 476 views 16 Hours";
            cell.leftTime.text = @"03:01";
            cell.leftBadge.backgroundColor = [UIColor colorWithRed:247/255.0 green:173/255.0 blue:46/255.0 alpha:1];
            cell.leftBadge.text = @"会员";
            cell.rightImage.image = [UIImage imageNamed:@"亲，累了吗？ 梁兄献上一曲为您解乏_梁小青.png"];
            cell.rightName.text = @"梁兄献上一曲为您解乏";
            cell.rightSecondName.text = @"梁小青 476 views 16 Hours";
            cell.rightTime.text = @"03:34";
            cell.rightBadge.backgroundColor = [UIColor colorWithRed:247/255.0 green:173/255.0 blue:46/255.0 alpha:1];
            cell.rightBadge.text = @"会员";
            return cell;
        }
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0){
            ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftImage.image = [UIImage imageNamed:@"「第三课」吉他基本功训练《MI 指型》_刘栋.png"];
            cell.leftName.text = @"「第三课」吉他基本功训练《MI 指型》";
            cell.leftSecondName.text = @"刘栋 476 views 16 Hours";
            cell.leftTime.text = @"04:34";
            cell.rightImage.image = [UIImage imageNamed:@"《天空之城》吉他指弹教学_苗帅畅.png"];
            cell.rightName.text = @"《天空之城》吉他指弹教学";
            cell.rightSecondName.text = @"苗帅畅 476 views 16 Hours";
            cell.rightTime.text = @"04:12";
            cell.rightBadge.backgroundColor = [UIColor colorWithRed:93/255.0 green:191/255.0 blue:133/255.0 alpha:1];
            cell.rightBadge.text = @"最新";
            return cell;
        } else if (indexPath.row == 1){
            ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftImage.image = [UIImage imageNamed:@"美式儿童钢琴启蒙课程_张怡筱.png"];
            cell.leftName.text = @"美式儿童钢琴启蒙课程";
            cell.leftSecondName.text = @"张怡筱 476 views 16 Hours";
            cell.leftTime.text = @"03:25";
            cell.rightBadge.backgroundColor = [UIColor colorWithRed:93/255.0 green:191/255.0 blue:133/255.0 alpha:1];
            cell.rightBadge.text = @"最新";
            cell.rightImage.image = [UIImage imageNamed:@"三招教会你弹即兴伴奏_周思亮.png"];
            cell.rightName.text = @"三招教会你弹即兴伴奏";
            cell.rightSecondName.text = @"周思亮 476 views 16 Hours";
            cell.rightTime.text = @"02:34";
            cell.rightBadge.backgroundColor = [UIColor colorWithRed:239/255.0 green:73/255.0 blue:46/255.0 alpha:1];
            cell.rightBadge.text = @"高清";
            return cell;
        }
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

@end
