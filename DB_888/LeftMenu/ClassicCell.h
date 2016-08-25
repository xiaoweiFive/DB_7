//
//  ClassicCell.h
//  夺宝吧
//
//  Created by xiaocai on 15/6/17.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassicModel.h"
@interface ClassicCell : UITableViewCell
//填充数据的方法
- (void)fillCellWithModel:(ClassicModel *)model;
@end
