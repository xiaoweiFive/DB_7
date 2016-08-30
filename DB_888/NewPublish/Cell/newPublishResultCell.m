//
//  newPublishResultCell.m
//  DB_888
//
//  Created by zhangzhenwei on 16/8/29.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "newPublishResultCell.h"

@implementation newPublishResultCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setModel:(NewPublishModel *)model{
    _model = model;
    
    [self.productImg sd_setImageWithURL:[NSURL URLWithString:model.thumb_url] placeholderImage:[UIImage imageNamed:@"moren"]];
    self.productDetail.text = [NSString stringWithFormat:@"(第%@期)%@",model.qishu,model.title];
    if ([model.q_username class] != [NSNull class] && (model.q_username != nil)) {
        self.productUser.text = model.q_username;
    }else{
        self.productUser.text =@"获取失败";
    }
    if (![model.q_user_code isKindOfClass:[NSNull class]] && (model.q_user_code != nil)){
        self.productMember.text = model.q_user_code;
    }else{
        self.productMember.text = @"无法获取";
    }
    
    self.productCount.text = [model.go_total stringByAppendingString:@"次"];
    
    self.productTime.text = model.q_end_time;
    
}

@end
