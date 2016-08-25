//
//  LeftMenuVC.m
//  夺宝吧
//
//  Created by xiaocai on 15/6/16.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "LeftMenuVC.h"
#import "MFSideMenu.h"
#import "SeachVC.h"
#import "ClassicModel.h"
#import "ClassicCell.h"

//获取分类信息url
#define CLASSIC_URL @"/api/ApiGoods/getGoodsCategories"
@interface LeftMenuVC ()<UITableViewDataSource,UITableViewDelegate>
{
    //数据源
    NSMutableArray *_data;
    //分类列表
    UITableView *_tableView;
}
@end

@implementation LeftMenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //数据源
    _data = [NSMutableArray array];
    //加载界面
    [self loadSubViews];
}

//加载界面
- (void)loadSubViews
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kDeviceScale, 84)];
    lab.backgroundColor = [UIColor redColor];
    [self.view addSubview:lab];
    //搜索按钮
    UIButton *seachBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    seachBtn.frame = CGRectMake(15, 25, 230, 30);
//    [seachBtn setImage:[UIImage imageNamed:@"icon_sidebar"] forState:UIControlStateNormal];
    seachBtn.layer.cornerRadius = 2;
    seachBtn.layer.masksToBounds = YES;
    seachBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    seachBtn.layer.borderWidth = 1;
    seachBtn.backgroundColor = [UIColor whiteColor];
    [seachBtn addTarget:self action:@selector(seachBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:seachBtn];
    UIImageView *seachImg = [[UIImageView alloc]initWithFrame:CGRectMake(20, 31, 18, 18)];
    seachImg.image = [UIImage imageNamed:@"icon_sidebar_search"];
    [self.view addSubview:seachImg];
    UILabel *seachLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(seachImg.frame)+2, CGRectGetMinY(seachImg.frame), 130, 18)];
    seachLab.textColor = [UIColor lightGrayColor];
    seachLab.text = @"搜索商品";
    [self.view addSubview:seachLab];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kDeviceWidth, KDeviceHeight - 64)];
    [_tableView registerNib:[UINib nibWithNibName:@"ClassicCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.rowHeight = 50.0f;
    [self.view addSubview:_tableView];
    //获取分类数据
    [self requestForData];
    
}
//获取分类数据
- (void)requestForData
{
    [_data removeAllObjects];

    NSArray *catid_list = @[@"10",@"13",@"11",@"12",@"14",@"16",@"15",@"17"];
    NSArray *name_list = @[@"数码影音",@"电脑办公",@"智能硬件",@"时尚家居",@"食品饮料",@"新手专区",@"任性专区",@"其他商品"];
    
    for (int i = 0; i < catid_list.count; i++) {
        ClassicModel *model = [[ClassicModel alloc]init];
        model.cls_name = name_list[i];
        model.cls_id = catid_list[i];
        model.cls_left_icon = [NSString stringWithFormat:@"icon%@",catid_list[i]];
        [_data addObject:model];
    }
    return;
    
    

}
//搜索按钮的监听事件
- (void)seachBtnOnClick
{
    SeachVC *seachVC = [[SeachVC alloc]init];
    
    [self.menuContainerViewController presentViewController:seachVC animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- 表格代理函数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClassicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (_data.count > 0) {
        ClassicModel *model = _data[indexPath.row];
        [cell fillCellWithModel:model];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    
    
}

@end
