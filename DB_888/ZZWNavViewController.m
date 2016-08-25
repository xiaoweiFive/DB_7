//
//  ZZWNavViewController.m
//  Zhang_tabBar
//
//  Created by zhangzhenwei on 16/8/19.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "ZZWNavViewController.h"



@interface ZZWNavViewController ()

@end

@implementation ZZWNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
}



#pragma mark 设置导航栏的属性
+ (void)initialize
{
    //1拿到设置主题的对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
    
    //2设置导航栏的背景图片
    if (!iOS7) {
        //1设置navBar的背景图片,设置状态栏的样式
        [navBar setBackgroundImage:[UIImage createImageWithColor:QSCTextColor] forBarMetrics:UIBarMetricsDefault];
        
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        
        //2设置导航栏上面的barButtonItem的背景图片
        [barButtonItem setBackgroundImage:[UIImage resizedImage:@"nav_back"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [barButtonItem setBackgroundImage:[UIImage resizedImage:@"nav_back"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [barButtonItem setBackgroundImage:[UIImage resizedImage:@"nav_back"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    }
    
    if (iOS7) {
        [navBar setBackgroundImage:[UIImage createImageWithColor:QSCTextColor] forBarMetrics:UIBarMetricsDefault];
        [navBar setBarTintColor: RGB(248, 248, 248)];
        [navBar setTintColor:RGB(248, 248, 248)];
    }
    
    
    //3设置导航栏标题颜色
    [navBar setTitleTextAttributes:@{
                                     
                                     NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
                                     UITextAttributeTextColor : [UIColor whiteColor],
                                     UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetZero]
                                     
                                     }];
    
    
    //4.1设置导航栏barButtonItem的文字在普通状态下的属性
    [barButtonItem setTitleTextAttributes:@{
                                            
                                            NSFontAttributeName : [UIFont systemFontOfSize:iOS7? 17 : 13],
                                            UITextAttributeTextColor : [UIColor whiteColor],
                                            UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetZero]
                                            
                                            } forState:UIControlStateNormal];
    //4.2设置导航栏barButtonItem的文字在高亮状态下的属性
    [barButtonItem setTitleTextAttributes:@{
                                            UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetZero]
                                            
                                            } forState:UIControlStateHighlighted];
    
    
    if (iOS7) {
        [barButtonItem setTitleTextAttributes:@{
                                                NSForegroundColorAttributeName : RGB(220, 220, 220)
                                                
                                                } forState:UIControlStateDisabled];
    }
    
    
}

//判断是否为根控制器展示元素
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //隐藏nav条
    if ( viewController == self) {
        [navigationController setNavigationBarHidden:YES animated:animated];
    }
    else if ( [navigationController isNavigationBarHidden] ) {
        [navigationController setNavigationBarHidden:NO animated:animated];
    }
    
    //判断将要显示的是否为根控制器
    if (viewController != navigationController.viewControllers[0] && viewController.navigationItem.leftBarButtonItem == nil) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) icon:@"nav_back" hightLightIcon:@"nav_back"];
    }
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    zzwPlusButton *plusBtn =  [ZZWGlobal shareQSCGlobal].plusBtn;

    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    
    [self setTabbarHiddenOrShow];

    return  [super popViewControllerAnimated:animated];
}


- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    [self setTabbarHiddenOrShow];

    return  [super popToRootViewControllerAnimated:animated];
}


- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self setTabbarHiddenOrShow];
    return  [super popToViewController:viewController animated:animated];
}


//控制tabbar的现实与隐藏
-(void)setTabbarHiddenOrShow{
    
    if (self.navigationController.viewControllers.count > 1) {
        self.tabBarController.tabBar.hidden = YES;
        
    }else {
        self.tabBarController.tabBar.hidden = NO;
        
    }
}


//返回
- (void)back
{
    [self popViewControllerAnimated:YES];
}
@end
