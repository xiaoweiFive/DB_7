//
//  DBBViewController.m
//  DB_888
//
//  Created by 李许康 on 16/8/30.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "DBBViewController.h"

@implementation DBBViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter ]addObserver:self selector:@selector(makeThekeyboarddismiss) name:UIApplicationWillEnterForegroundNotification object:nil];
}
/**
 *  程序退到后台,键盘收起
 */
-(void)makeThekeyboarddismiss{
    
    [self.view endEditing:YES];
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
}
@end
