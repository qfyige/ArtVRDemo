//
//  CategoryPageViewController.m
//  ArtVRDemo
//
//  Created by Jack Liu on 6/11/16.
//  Copyright © 2016 Jack Liu. All rights reserved.
//

#import "CategoryPageViewController.h"
#import "ImageTableViewCell.h"
#import "VideoDetailViewController.h"

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define RightMargin 10

@implementation CategoryPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.categoryTableView registerNib:[UINib nibWithNibName:@"ImageTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ImageTableViewCell"];
    [self.categoryTableView registerNib:[UINib nibWithNibName:@"HotCategoryTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"HotCategoryTableViewCell"];
    [self.categoryTableView registerNib:[UINib nibWithNibName:@"TopicTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TopicTableViewCell"];
    //header view
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 260)];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 375, 30)];
    label1.text = @"|  吉他  |  钢琴  |  古筝  |  葫芦丝  |  小提琴";
    label1.font = [UIFont systemFontOfSize:15.0];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 375, 30)];
    label2.text = @"|  萨克斯  |  琵琶  |  二胡  |  电子琴  |  架子鼓";
    label2.font = [UIFont systemFontOfSize:15.0];
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, 375, 30)];
    label3.text = @"|  大提琴  |  电吉他  |  单簧管  |  双簧管  |  笛子";
    label3.font = [UIFont systemFontOfSize:15.0];
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(10, 90, 375, 30)];
    label4.text = @"|  扬琴  |  爵士鼓  |  长号  |  唢呐  |  小号  |  圆号";
    label4.font = [UIFont systemFontOfSize:15.0];
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(10, 120, 375, 30)];
    label5.text = @"|  手鼓  |  非洲鼓  |  马林巴  |  口琴  |  贝斯";
    label5.font = [UIFont systemFontOfSize:15.0];
    UILabel *label6 = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, 375, 30)];
    label6.text = @"|  手风琴  |  箫  |  尤克里里  |  古琴  |  巴扬手风琴";
    label6.font = [UIFont systemFontOfSize:15.0];
    UILabel *label7 = [[UILabel alloc] initWithFrame:CGRectMake(10, 180, 375, 30)];
    label7.text = @"|  笙  |  陶笛  |  低音提琴  |  大号  |  双排键";
    label7.font = [UIFont systemFontOfSize:15.0];
    UILabel *label8 = [[UILabel alloc] initWithFrame:CGRectMake(10, 210, 375, 30)];
    label8.text = @"|  巴乌  |  长笛  |  中阮  |  马头琴  |  箜篌  |  其他  ";
    label8.font = [UIFont systemFontOfSize:15.0];
    [headerView addSubview:label1];
    [headerView addSubview:label2];
    [headerView addSubview:label3];
    [headerView addSubview:label4];
    [headerView addSubview:label5];
    [headerView addSubview:label6];
    [headerView addSubview:label7];
    [headerView addSubview:label8];
    self.categoryTableView.tableHeaderView = headerView;
    self.categoryTableView.delegate=self;
    self.categoryTableView.dataSource=self;
}

- (void)viewWillAppear:(BOOL)animated{
    //set up TabBar color
    //UITabBar *tabBar = [self.tabBarController tabBar];
    //[tabBar setBarTintColor:[UIColor colorWithRed:247/255.0 green:173/255.0 blue:46/255.0 alpha:1]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //分组数 也就是section数
    return 2;
}

//设置每个分组下tableview的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 2;
    } else if (section==1){
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
        leftLabel.text = @"钢琴课程精选";
        leftLabel.font = [UIFont systemFontOfSize:14.0];
        UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-RightMargin-20, 0, 20, 20)];
        rightLabel.text = @">";
        rightLabel.textAlignment = NSTextAlignmentRight;
        rightLabel.font = [UIFont systemFontOfSize:14.0];
        [view addSubview:leftLabel];
        [view addSubview:rightLabel];
        return view;
    } else if (section == 1) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
        view.backgroundColor = [UIColor whiteColor];
        UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ScreenWidth, 20)];
        leftLabel.text = @"吉他课程精选";
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
        return 145;
    } else if (indexPath.section == 1) {
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
            ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftImage.image = [UIImage imageNamed:@"成人钢琴即兴伴奏》免费体验课_董哥.png"];
            cell.leftName.text = @"成人钢琴即兴伴奏》免费体验课";
            cell.leftSecondName.text = @"董哥 476 views 16 Hours";
            cell.leftTime.text = @"03:01";
            cell.rightImage.image = [UIImage imageNamed:@"美式儿童钢琴启蒙课程_张怡筱.png"];
            cell.rightName.text = @"美式儿童钢琴启蒙课程";
            cell.rightSecondName.text = @"张怡筱 476 views 16 Hours";
            cell.rightTime.text = @"03:25";
            return cell;
        } else if (indexPath.row == 1){
            ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftImage.image = [UIImage imageNamed:@"快乐钢琴基础教程（启蒙）_董哥.png"];
            cell.leftName.text = @"快乐钢琴基础教程（启蒙）";
            cell.leftSecondName.text = @"董哥 476 views 16 Hours";
            cell.leftTime.text = @"02:34";
            cell.rightImage.image = [UIImage imageNamed:@"「基督徒学钢琴」_蓝调小生.png"];
            cell.rightName.text = @"「基督徒学钢琴」";
            cell.rightSecondName.text = @"蓝调小生 476 views 16 Hours";
            cell.rightTime.text = @"04:34";
            return cell;
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0){
            ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftImage.image = [UIImage imageNamed:@"木吉他弹唱速成班免费试学_黄家发.png"];
            cell.leftName.text = @"木吉他弹唱速成班免费试学";
            cell.leftSecondName.text = @"黄家发 476 views 16 Hours";
            cell.leftTime.text = @"02:24";
            cell.rightImage.image = [UIImage imageNamed:@"木吉他 情非得已 吉他教学_白音格根.png"];
            cell.rightName.text = @"木吉他 情非得已 吉他教学";
            cell.rightSecondName.text = @"白音格根 476 views 16 Hours";
            cell.rightTime.text = @"01:59";
            return cell;
        } else if (indexPath.row == 1){
            ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageTableViewCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftImage.image = [UIImage imageNamed:@"吉他基本功练习-适用于古典与民谣吉他_萧我锋.png"];
            cell.leftName.text = @"吉他基本功练习-适用于古典与民谣吉他";
            cell.leftSecondName.text = @"萧我锋 476 views 16 Hours";
            cell.leftTime.text = @"03:34";
            cell.rightImage.image = [UIImage imageNamed:@"「一分钟教学」吉他弹唱系列_陈冠宇.png"];
            cell.rightName.text = @"「一分钟教学」吉他弹唱系列";
            cell.rightSecondName.text = @"陈冠宇 476 views 16 Hours";
            cell.rightTime.text = @"02:49";
            return cell;
        }
    }
    return cell;
}

//处理点击事件
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 || indexPath.section == 1){
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        VideoDetailViewController *videoDetail = [storyboard instantiateViewControllerWithIdentifier:@"VideoDetailViewController"];
        [self.navigationController pushViewController:videoDetail animated:YES];
    }
    
}


@end
