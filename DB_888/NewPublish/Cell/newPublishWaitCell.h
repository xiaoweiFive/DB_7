//
//  newPublishWaitCell.h
//  DB_888
//
//  Created by zhangzhenwei on 16/8/29.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewPublishModel.h"


@interface newPublishWaitCell : UITableViewCell


@property (nonatomic, strong)NewPublishModel *model;


@property (weak, nonatomic) IBOutlet UIImageView *productImg;
@property (weak, nonatomic) IBOutlet UILabel *productLab;
@property (weak, nonatomic) IBOutlet UIImageView *clockImg;


@property (strong, nonatomic)  UILabel *timeLab;

@end
