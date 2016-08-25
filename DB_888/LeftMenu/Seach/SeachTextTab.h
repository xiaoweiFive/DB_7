//
//  SeachTextTab.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/17.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeachVC.h"
@interface SeachTextTab : UITableView
//数据包
@property (nonatomic,strong)NSArray *data;
//所在控制器
@property (nonatomic,weak)SeachVC *father;
@end
