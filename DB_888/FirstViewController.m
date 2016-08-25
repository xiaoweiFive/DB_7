//
//  FirstViewController.m
//  DB_888
//
//  Created by zhangzhenwei on 16/8/25.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    //加载导航条
    [self loadCustomNaviBar];
}

//加载导航条
- (void)loadCustomNaviBar
{
        self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(meauBtnOnClick) icon:@"icon_menu_sidebar.png" hightLightIcon:@"icon_menu_sidebar.png"];
    
}
- (void)meauBtnOnClick
{
    //展开左菜单
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
        AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
        [myDelegate.leftMenuVC requestForData];
    }];
}
//更多按钮的监听事件
- (void)moreBtnOnClick
{
//    SeachVC *seachVC = [[SeachVC alloc]init];
//    [self.navigationController presentViewController:seachVC animated:YES completion:nil];
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
