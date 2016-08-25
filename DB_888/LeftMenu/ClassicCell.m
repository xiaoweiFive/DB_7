//
//  ClassicCell.m
//  夺宝吧
//
//  Created by xiaocai on 15/6/17.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "ClassicCell.h"

@interface ClassicCell ()
{

    __weak IBOutlet UIImageView *leftImg;
    __weak IBOutlet UILabel *nameLab;
    __weak IBOutlet UIImageView *rightImg;
    
}
@end
@implementation ClassicCell

- (void)awakeFromNib {
    leftImg.frame = CGRectMake(leftImg.frame.origin.x, leftImg.frame.origin.y, leftImg.frame.size.width, leftImg.frame.size.height);
    // Initialization code
//    [self addSubview:[WYPublic getFenGexian:52 :self.frame.size.height - 0.5 :WYMWITH :0.5]];
}
//填充数据的方法
- (void)fillCellWithModel:(ClassicModel *)model
{
//    [leftImg sd_setImageWithURL:[NSURL URLWithString:model.cls_left_icon] placeholderImage:[UIImage imageNamed:@""]];
    nameLab.text = model.cls_name;
    [leftImg setImage:[UIImage imageNamed:model.cls_left_icon]];
//    [rightImg sd_setImageWithURL:[NSURL URLWithString:model.cls_right_icon] placeholderImage:[UIImage imageNamed:@""]];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
