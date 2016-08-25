//
//  ZZWTabBarController.m
//  DB_888
//
//  Created by zhangzhenwei on 16/8/24.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "ZZWTabBarController.h"

@interface ZZWTabBarController ()

@end

@implementation ZZWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildControllers];
}

- (void)setupChildControllers
{
    [self setupChildNavigationControllerWithClass:[UINavigationController class] tabBarImageName:@"icon_menu_home_normal" andTabBarSelectImageName:@"icon_menu_home_press" rootViewControllerClass:[UIViewController class] rootViewControllerTitle:@"夺宝吧"];
    
    [self setupChildNavigationControllerWithClass:[UINavigationController class] tabBarImageName:@"icon_menu_jiexiao_normal" andTabBarSelectImageName:@"icon_menu_jiexiao_press" rootViewControllerClass:[UIViewController class] rootViewControllerTitle:@"最新揭晓"];
    
    [self setupChildNavigationControllerWithClass:[UINavigationController class] tabBarImageName:@"icon_menu_buy_normal" andTabBarSelectImageName:@"icon_menu_buy_press"  rootViewControllerClass:[UIViewController class] rootViewControllerTitle:@"购物车"];
    
    [self setupChildNavigationControllerWithClass:[UINavigationController class] tabBarImageName:@"icon_menu_me_normal"  andTabBarSelectImageName:@"icon_menu_me_press" rootViewControllerClass:[UIViewController class] rootViewControllerTitle:@"我的夺宝"];
    
}

- (void)setupChildNavigationControllerWithClass:(Class)class tabBarImageName:(NSString *)name  andTabBarSelectImageName:(NSString *)selectedName rootViewControllerClass:(Class)rootViewControllerClass rootViewControllerTitle:(NSString *)title
{
    UIViewController *rootVC = [[rootViewControllerClass alloc] init];
    rootVC.title = title;
    UINavigationController *navVc = [[class  alloc] initWithRootViewController:rootVC];
    navVc.tabBarItem.image = [UIImage imageNamed:name];

    // 如果是iOS7，不要渲染选中的图片
    if (iOS7) {
        navVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        navVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedName];
    }
    
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor lightGrayColor], UITextAttributeTextColor,
                                                       nil] forState:UIControlStateNormal];
    UIColor *titleHighlightedColor = [UIColor redColor];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleHighlightedColor, UITextAttributeTextColor,
                                                       nil] forState:UIControlStateSelected];
    
    [self addChildViewController:navVc];
}

@end
