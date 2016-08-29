//
//  NewPublishViewController.m
//  DB_888
//
//  Created by zhangzhenwei on 16/8/29.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "NewPublishViewController.h"
#import "NewPublishModel.h"
#import "newPublishResultCell.h"
#import "newPublishWaitCell.h"


@interface NewPublishViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSInteger _page;
    NSMutableArray *_dataArray;

}

@property(nonnull , strong) UITableView *tableView;

@end

@implementation NewPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    _dataArray = [NSMutableArray array];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, KDeviceHeight-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"newPublishWaitCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
    [_tableView registerNib:[UINib nibWithNibName:@"newPublishResultCell" bundle:nil] forCellReuseIdentifier:@"cell2"];
    [self.view addSubview:self.tableView];
    

    
    __weak __typeof(self)weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _page = 1;
        
        [weakSelf getProList];
        
    }];
        [self.tableView.mj_header beginRefreshing];
        
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        _page +=1;
        [weakSelf getProList];
    }];
    
    MJRefreshBackStateFooter *footer1 =(MJRefreshBackStateFooter *) self.tableView.mj_footer;
    [footer1 setTitle:@"" forState:MJRefreshStateIdle];

}

-(void)getProList
{
    NSDictionary *params = @{@"num":@"20",@"page":[NSString stringWithFormat:@"%ld",(unsigned long)_page]};
    
    [ZZWHttpTool post:ZZW_PUBLISH_URL parameters:params httpToolSuccess:^(id json) {
        MYLog(@"json ====  %@",json);
        
        
        NSArray *array = json[@"data"];
        for (int i = 0; i<array.count ; i++) {
            NewPublishModel  *model = [NewPublishModel objectWithKeyValues:array[i]];
            [_dataArray addObject:model];
        }
        
        
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
    } failure:^(NSError *error) {
        MYLog(@"error === %@",error);

    }];

    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(_dataArray.count > 0)
    {
        NewPublishModel *model = _dataArray[indexPath.row];
        if ([model.q_showtime isEqualToString:@"N"]) {
            newPublishResultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.model = model;
//            [cell fillCellWhithModel:model];
            NSLog(@"LastestResCell: %p",cell);
            return cell;
        }else{
            newPublishWaitCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
//            cell.father = self;
            cell.model = model;
//            [cell fillCellWhithModel:model Index:indexPath.row];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            NSLog(@"LastestWaitCell: %p",cell);
            return cell;
        }
    }
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
}



@end
