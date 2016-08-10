//
//  MypageDetailViewController.m
//  ArtVRDemo
//
//  Created by Jack Liu on 6/30/16.
//  Copyright © 2016 Jack Liu. All rights reserved.
//

#import "MypageDetailViewController.h"
#import "MyPageDetailTableViewCell.h"
@interface MypageDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *showTableView;

@end

@implementation MypageDetailViewController
{
    NSArray *_data;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSDictionary *dic1 = @{@"title":@"李通",@"image":@"role-1"};
    NSDictionary *dic2 = @{@"title":@"名字",@"detail":@"李通"};
    NSDictionary *dic3 = @{@"title":@"性别",@"detail":@"男"};
    NSDictionary *dic4 = @{@"title":@"密码",@"detail":@"12345"};
    NSDictionary *dic5 = @{@"title":@"微信",@"detail":@"18510871368"};

    _data = [[NSArray alloc] initWithObjects:dic1,dic2,dic3,dic4,dic5, nil];
    [self.showTableView registerNib:[UINib nibWithNibName:@"MyPageDetailTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    self.showTableView.delegate = self;
    self.showTableView.dataSource = self;
    self.showTableView.tableFooterView = [[UIView alloc] init];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyPageDetailTableViewCell *cell = [self.showTableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.data = [_data objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if( indexPath.row == 0){
        return 88;
    }
    return 44;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
