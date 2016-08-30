//
//  newPublishResultCell.h
//  DB_888
//
//  Created by zhangzhenwei on 16/8/29.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewPublishModel.h"

@interface newPublishResultCell : UITableViewCell

@property (nonatomic, strong)NewPublishModel *model;


@property (weak, nonatomic) IBOutlet UIImageView *productImg;
@property (weak, nonatomic) IBOutlet UILabel *productDetail;
@property (weak, nonatomic) IBOutlet UILabel *productUser;

@property (weak, nonatomic) IBOutlet UILabel *productMember;

@property (weak, nonatomic) IBOutlet UILabel *productCount;

@property (weak, nonatomic) IBOutlet UILabel *productTime;



@end
