//
//  SeachTextTab.m
//  夺宝吧
//
//  Created by xiaocai on 15/6/17.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "SeachTextTab.h"
#import "SeachTextModel.h"

@interface SeachTextTab ()<UITableViewDataSource,UITableViewDelegate>
{
    
}
@end
@implementation SeachTextTab

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.delegate = self;
        self.dataSource = self;
        self.tableFooterView = [[UIView alloc]init];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Dbb_backColor"]];
    }
    return self;
}
- (void)setData:(NSArray *)data
{
    _data = data;
    [self reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(_data.count > 10)
    {
        return 10;
    }
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    if (_data.count>0) {
        SeachTextModel *model = _data[indexPath.row];
        cell.textLabel.text = model.seach_text;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SeachTextModel *modle = _data[indexPath.row];
    [[WYMainTabBarVC shareMainTaBarVC] seachBtnOnClick:modle.seach_text];
    [self.father dismissViewControllerAnimated:NO completion:^{
        
    }];
}

@end
