//
//  SeachVC.m
//  夺宝吧
//
//  Created by xiaocai on 15/6/17.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "SeachVC.h"
#import "SeachView.h"
#import "MFSideMenu.h"
#import "SeachTextTab.h"
#import "SeachTextModel.h"
#define HOT_TEXT_URL @"/api/ApiMisc/getRecommendKeywords"
@interface SeachVC ()<UIScrollViewDelegate>
{
    SeachView *_seachView;
    //搜索历史界面
    SeachTextTab *_historyTab;
    //热搜索界面
    SeachTextTab *_hotTab;
    UIScrollView *s;
    //创建删除历史按钮
    UIButton *delBtn;
}
@end

@implementation SeachVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadupViews];
   
    //搜索历史和热搜词界面
    [self loadSeachViews];
    //请求热搜词
    [self requestForHotText];
}

//加载上方的控件
- (void)loadupViews
{
    _seachView = [[[NSBundle mainBundle]loadNibNamed:@"SeachView" owner:self options:nil]lastObject];
    _seachView.frame = CGRectMake(0, 0, WYMWITH, _seachView.frame.size.height);
    _seachView.father = self;
    [self.view addSubview:_seachView];
}
//搜索历史和热搜词界面
- (void)loadSeachViews
{
    s = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_seachView.frame), WYMWITH, WYMHEIGHT- CGRectGetMaxY(_seachView.frame))];
    _historyTab = [[SeachTextTab alloc]initWithFrame:CGRectMake(0, 0, s.frame.size.width, s.frame.size.height)];
    _historyTab.father = self;
    //创建删除历史按钮
    UIView *footer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WYMWITH, 100)];
    delBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    delBtn.frame = CGRectMake(0, 0, footer.frame.size.width - 120, 35);
    delBtn.center = CGPointMake(footer.frame.size.width/2, footer.frame.size.height/2);
    delBtn.layer.masksToBounds = YES;
    delBtn.layer.cornerRadius = 2;
    delBtn.layer.borderColor = [UIColor darkGrayColor].CGColor;
    delBtn.layer.borderWidth = 1.0;
    [delBtn setTitle:@"清空搜索历史" forState:UIControlStateNormal];
    delBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [delBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [delBtn addTarget:self action:@selector(delBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [footer addSubview:delBtn];
    _historyTab.tableFooterView = footer;
    //获取搜索历史
    [self getHistory];
    _hotTab = [[SeachTextTab alloc]initWithFrame:CGRectMake(WYMWITH, 0, s.frame.size.width, s.frame.size.height)];
    _hotTab.father = self;
    s.contentSize = CGSizeMake(WYMWITH*2, 0);
    s.pagingEnabled = YES;
    s.delegate = self;
    [s addSubview:_historyTab];
    [s addSubview:_hotTab];
    [self.view addSubview:s];
}
//删除搜索历史
- (void)delBtnOnClick
{
    [[WYDataBase sharedDataBase]deleAllSeachText];
    [self getHistory];
}
//获取搜索历史
- (void)getHistory
{
    NSArray *his = [[WYDataBase sharedDataBase]getAllSeachText];
    NSMutableArray *ddata = [NSMutableArray array];
    for (NSString *seachtext in his) {
        SeachTextModel *model = [[SeachTextModel alloc]init];
        model.seach_id = @"";
        model.seach_text = seachtext;
        [ddata addObject:model];
    }
    if (his.count == 0) {
        delBtn.hidden = YES;
    }else{
        delBtn.hidden = NO;
    }
    _historyTab.data = ddata;
    if (ddata.count == 0) {
        [_seachView changeOffetOfLocationViewWithIndex:1];
        s.contentOffset = CGPointMake(WYMWITH, 0);
    }
}
//请求热搜词
- (void)requestForHotText
{
    NSDictionary *params = @{@"limit":@"100"};
    [WYRequest startPostForDicWithUrlStR:[NSString stringWithFormat:@"%@%@",DBB_IP,HOT_TEXT_URL] Parameters:params successBlock:^(NSDictionary *dic) {
        NSArray *texts = dic[@"data"];
        NSMutableArray *data = [NSMutableArray array];
        for (NSString *text in texts) {
            SeachTextModel *model = [[SeachTextModel alloc]init];
            model.seach_text = text;
            [data addObject:model];
        }
        _hotTab.data = data;
    } failedBlock:^{
        
    } needLog:NO];
}
//改变对应按钮内容坐标
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger indext = scrollView.contentOffset.x/scrollView.frame.size.width;
    [_seachView changeOffetOfLocationViewWithIndex:indext];
}
//改变内容对应按钮（按钮点击激活）
- (void)changeoffsetByIndex:(NSInteger)index
{
    [UIView animateWithDuration:0.20 animations:^{
        s.contentOffset = CGPointMake(WYMWITH*index, 0);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
