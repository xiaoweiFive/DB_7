//
//  FirstViewController.m
//  DB_888
//
//  Created by zhangzhenwei on 16/8/25.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "FirstViewController.h"
#import "CorePPTVC.h"
#import "PPTModel.h"
#import "ADModel.h"


@interface FirstViewController ()
{
    UIView *_bannerHeaderView;
    ADModel *_model;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //加载导航条
    [self loadCustomNaviBar];
    [self requestForData];
    
    
}

//加载导航条
- (void)loadCustomNaviBar
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(meauBtnOnClick) icon:@"icon_menu_sidebar.png" hightLightIcon:@"icon_menu_sidebar.png"];
    
}


-(void)requestForData{
    
    [ZZWHttpTool post:ZZW_AD_URL parameters:nil httpToolSuccess:^(id json) {

        NSArray *dataArray = json[@"data"];
        if (dataArray.count) {
            [self setBannerView:dataArray];
        }

        MYLog(@"json ===  %@",json);
        
    } failure:^(NSError *error) {
        MYLog(@"error = == %@",error);
    }];
    

}


//图片模型数组
- (void)setBannerView:(NSArray *)results
{
    _bannerHeaderView = [[UIView alloc]initWithFrame: CGRectMake(0, 0, kDeviceWidth, 100)];
    [self.view addSubview:_bannerHeaderView];

    NSMutableArray *pptModels = [NSMutableArray array];
    

    
    for (int i= 0; i < results.count; i++) {
        
        id dict = results[i];
        if ([dict isKindOfClass:[NSDictionary class]]) {
            ADModel *model = [ADModel objectWithKeyValues:dict];
            
            PPTModel *pptModel = [[PPTModel alloc] init];
            pptModel.image = model.img_url;
            pptModel.imageURLString = model.img_url;
//            pptModel.title = model.title;
           
            
            [pptModels addObject:pptModel];

        }
    }
    
    
    CorePPTVC *pptvc = [[CorePPTVC alloc] init];
    pptvc.pptModels = pptModels;
    pptvc.view.frame = CGRectMake(0, 0, kDeviceWidth, 100);
    pptvc.pptItemClickBlock = ^(PPTModel *pptModel){
       
        MYLog(@"点击事件");
    };
    
    [self addChildViewController:pptvc];
    
    [UIView transitionWithView:_bannerHeaderView duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [_bannerHeaderView addSubview:pptvc.view];
    } completion:^(BOOL finished) {}];

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






@end
