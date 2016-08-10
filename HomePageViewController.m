//
//  HomePageViewController.m
//  ArtVRDemo
//
//  Created by Jack Liu on 6/11/16.
//  Copyright © 2016 Jack Liu. All rights reserved.
//

#import "HomePageViewController.h"
#import "ImageTableViewCell.h"
#import "VideoDetailViewController.h"


#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define RightMargin 10

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.homeTableView registerNib:[UINib nibWithNibName:@"ImageTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ImageTableViewCell"];
    [self.homeTableView registerNib:[UINib nibWithNibName:@"HotCategoryTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"HotCategoryTableViewCell"];
    [self.homeTableView registerNib:[UINib nibWithNibName:@"TopicTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TopicTableViewCell"];
    [self.homeTableView registerNib:[UINib nibWithNibName:@"HotTeachersTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"HotTeachersTableViewCell"];
    //header view
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 220)];
    headerView.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 355, 200)];
    imageView.image=[UIImage imageNamed:@"homepageheader.png"];
    [headerView addSubview:imageView];
    self.homeTableView.tableHeaderView = headerView;
    self.homeTableView.delegate=self;
    self.homeTableView.dataSource=self;
}

- (void)viewWillAppear:(BOOL)animated{
    //set up TabBar color
    //UITabBar *tabBar = [self.tabBarController tabBar];
    //[tabBar setBarTintColor:[UIColor colorWithRed:239/255.0 green:73/255.0 blue:46/255.0 alpha:1]];
    //[tabBar setTintColor:[UIColor whiteColor]];
    
}

- (void)viewDidDisappear:(BOOL)animated{
   // [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //分组数 也就是section数
    return 6;
}

//设置每个分组下tableview的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 2;
    } else if (section==1){
        return 1;
    } else if (section==2){
        return 2;
    } else if (section==3){
        return 2;
    } else if (section==4){
        return 1;
    } else if (section==5){
        return 1;
    } else {
        return 2;
    }
    
}
//每个分组上边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 20;
    } else if (section == 2) {
        return 20;
    } else if (section == 3) {
        return 20;
    } else if (section == 4) {
        return 20;
    } else if (section == 5) {
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
        return nil;
    } else if (section == 1) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
        view.backgroundColor = [UIColor whiteColor];
        UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ScreenWidth, 20)];
        leftLabel.text = @"热门课程分类";
        leftLabel.font = [UIFont systemFontOfSize:14.0];
        UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-RightMargin-60, 0, 60, 20)];
        rightLabel.text = @"全部 >";
        rightLabel.textAlignment = NSTextAlignmentRight;
        rightLabel.font = [UIFont systemFontOfSize:14.0];
        [view addSubview:leftLabel];
        [view addSubview:rightLabel];
        return view;
    } else if (section == 2) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
        view.backgroundColor = [UIColor whiteColor];
        UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ScreenWidth, 20)];
        leftLabel.text = @"热门全景课程";
        leftLabel.font = [UIFont systemFontOfSize:14.0];
        UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-RightMargin-20, 0, 20, 20)];
        rightLabel.text = @">";
        rightLabel.textAlignment = NSTextAlignmentRight;
        rightLabel.font = [UIFont systemFontOfSize:14.0];
        [view addSubview:leftLabel];
        [view addSubview:rightLabel];
        return view;
    } else if (section == 3) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
        view.backgroundColor = [UIColor whiteColor];
        UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ScreenWidth, 20)];
        leftLabel.text = @"精选全景课程";
        leftLabel.font = [UIFont systemFontOfSize:14.0];
        UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-RightMargin-20, 0, 20, 20)];
        rightLabel.text = @">";
        rightLabel.textAlignment = NSTextAlignmentRight;
        rightLabel.font = [UIFont systemFontOfSize:14.0];
        [view addSubview:leftLabel];
        [view addSubview:rightLabel];
        return view;
    } else if (section == 4) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
        view.backgroundColor = [UIColor whiteColor];
        UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ScreenWidth, 20)];
        leftLabel.text = @"专题活动";
        leftLabel.font = [UIFont systemFontOfSize:14.0];
        UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-RightMargin-20, 0, 20, 20)];
        rightLabel.text = @">";
        rightLabel.textAlignment = NSTextAlignmentRight;
        rightLabel.font = [UIFont systemFontOfSize:14.0];
        [view addSubview:leftLabel];
        [view addSubview:rightLabel];
        return view;
    } else if (section == 5) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
        view.backgroundColor = [UIColor whiteColor];
        UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ScreenWidth, 20)];
        leftLabel.text = @"人气讲师推荐";
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
        return 145;
    } else if (indexPath.section == 1) {
        return 100;
    } else if (indexPath.section == 2) {
        return 145;
    } else if (indexPath.section == 3) {
        return 145;
    } else if (indexPath.section == 4) {
        return 222;
    } else if (indexPath.section == 5) {
        return 65;
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
            ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftImage.image = [UIImage imageNamed:@"钢琴零基础第一期视频课1_拾雷.png"];
            cell.leftName.text = @"钢琴零基础第一期视频课1";
            cell.leftSecondName.text = @"拾雷 476 views 16 Hours";
            cell.leftTime.text = @"02:24";
            cell.rightImage.image = [UIImage imageNamed:@"古筝入门系列体验课程_宋浩源.png"];
            cell.rightName.text = @"古筝入门系列体验课程";
            cell.rightSecondName.text = @"宋浩源 476 views 16 Hours";
            cell.rightTime.text = @"04:56";
            return cell;
        } else if (indexPath.row == 1){
            ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftImage.image = [UIImage imageNamed:@"美式儿童钢琴启蒙课程_张怡筱.png"];
            cell.leftName.text = @"美式儿童钢琴启蒙课程";
            cell.leftSecondName.text = @"张怡筱 476 views 16 Hours";
            cell.leftTime.text = @"03:01";
            cell.rightImage.image = [UIImage imageNamed:@"木吉他 情非得已 吉他教学_白音格根.png"];
            cell.rightName.text = @"木吉他 情非得已 吉他教学";
            cell.rightSecondName.text = @"白音格根 476 views 16 Hours";
            cell.rightTime.text = @"01:56";
            return cell;
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0){
            ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotCategoryTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0){
            ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftImage.image = [UIImage imageNamed:@"成人钢琴即兴伴奏》免费体验课_董哥.png"];
            cell.leftName.text = @"成人钢琴即兴伴奏》免费体验课";
            cell.leftSecondName.text = @"董哥 476 views 16 Hours";
            cell.leftTime.text = @"01:56";
            cell.leftBadge.backgroundColor = [UIColor colorWithRed:93/255.0 green:191/255.0 blue:133/255.0 alpha:1];
            cell.leftBadge.text = @"会员";
            cell.rightImage.image = [UIImage imageNamed:@"《天空之城》吉他指弹教学_苗帅畅.png"];
            cell.rightName.text = @"《天空之城》吉他指弹教学";
            cell.rightSecondName.text = @"苗帅畅 476 views 16 Hours";
            cell.rightTime.text = @"03:01";
            cell.rightBadge.backgroundColor = [UIColor colorWithRed:247/255.0 green:173/255.0 blue:46/255.0 alpha:1];
            cell.rightBadge.text = @"会员";
            return cell;
        } else if (indexPath.row == 1){
            ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftImage.image = [UIImage imageNamed:@"张骎驰老师教你弹出最好听的《浏阳河》_张骎驰.png"];
            cell.leftName.text = @"张骎驰老师教你弹出最好听的《浏阳河》";
            cell.leftSecondName.text = @"张骎驰 476 views 16 Hours";
            cell.leftTime.text = @"02:34";
            cell.rightImage.image = [UIImage imageNamed:@"教你弹会《南山南》_朱颜圆.png"];
            cell.rightName.text = @"教你弹会《南山南》";
            cell.rightSecondName.text = @"朱颜圆 476 views 16 Hours";
            cell.rightTime.text = @"03:25";
            cell.rightBadge.backgroundColor = [UIColor colorWithRed:93/255.0 green:191/255.0 blue:133/255.0 alpha:1];
            cell.rightBadge.text = @"会员";
            return cell;
        }
    } else if (indexPath.section == 3) {
        if (indexPath.row == 0){
            ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftImage.image = [UIImage imageNamed:@"零基础新手民谣吉他弹唱自学教程 第1课_米萧.png"];
            cell.leftName.text = @"零基础新手民谣吉他弹唱自学教程 第1课";
            cell.leftSecondName.text = @"米萧 476 views 16 Hours";
            cell.leftTime.text = @"01:59";
            cell.leftBadge.text = @"全景";
            cell.rightImage.image = [UIImage imageNamed:@"陶笛速成班_黄晨.png"];
            cell.rightName.text = @"陶笛速成班";
            cell.rightSecondName.text = @"黄晨 476 views 16 Hours";
            cell.rightTime.text = @"04:12";
            cell.rightBadge.text = @"全景";
            return cell;
        } else if (indexPath.row == 1){
            ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftImage.image = [UIImage imageNamed:@"陶笛演奏试听课_许世奇.png"];
            cell.leftName.text = @"陶笛演奏试听课";
            cell.leftSecondName.text = @"许世奇 476 views 16 Hours";
            cell.leftTime.text = @"02:49";
            cell.leftBadge.text = @"全景";
            cell.rightImage.image = [UIImage imageNamed:@"木吉他弹唱速成班免费试学_黄家发.png"];
            cell.rightName.text = @"木吉他弹唱速成班免费试学";
            cell.rightSecondName.text = @"黄家发 476 views 16 Hours";
            cell.rightTime.text = @"03:34";
            cell.rightBadge.text = @"全景";
            return cell;
        }
    } else if (indexPath.section == 4) {
        if (indexPath.row == 0){
            ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopicTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        
    } else if (indexPath.section == 5) {
        if (indexPath.row == 0){
            ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotTeachersTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        
    }
    return cell;
}

//处理点击事件
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 || indexPath.section == 2 || indexPath.section == 3 || indexPath.section == 4){
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        VideoDetailViewController *videoDetail = [storyboard instantiateViewControllerWithIdentifier:@"VideoDetailViewController"];
        [self.navigationController pushViewController:videoDetail animated:YES];
        //[self presentViewController:videoDetail animated:YES completion:^{
            
        //}];
    }
    
}

@end
