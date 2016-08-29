//
//  newPublishWaitCell.m
//  DB_888
//
//  Created by zhangzhenwei on 16/8/29.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "newPublishWaitCell.h"
#import "NSDate+Interval.h"
#import "MZTimerLabel.h"

@interface newPublishWaitCell(){
    MZTimerLabel *timerExample1;

}

@end


@implementation newPublishWaitCell

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
    // 下面是添加显示剩余时间的label
    [self.productImg sd_setImageWithURL:[NSURL URLWithString:model.thumb_url] placeholderImage:[UIImage imageNamed:@"moren"]];
    self.productLab.text = [NSString stringWithFormat:@"(第%@期)%@",model.qishu,model.title];

    self.timeLab  = [[UILabel alloc]initWithFrame:CGRectMake(120, 50, 150, 34)];
    self.timeLab.backgroundColor = [UIColor clearColor];
    self.timeLab.textColor = [UIColor redColor];
    self.timeLab.tag = 111;
    self.timeLab.font = [UIFont systemFontOfSize:34];
    [self addSubview:self.timeLab];
    
    
    if ([[[NSDate date] intervalSinceNow:model.q_end_time] intValue]>0) {
        [self.timeLab removeFromSuperview];
        UILabel *jxLab = self.timeLab = [[UILabel alloc]initWithFrame:CGRectMake(125, 50, 150, 34)];
        jxLab.backgroundColor = [UIColor clearColor];
        jxLab.textColor = [UIColor redColor];
        jxLab.tag = 333;
        jxLab.font = [UIFont systemFontOfSize:29];
        jxLab.text = @"正在开奖";
        [self addSubview:jxLab];
    }else{
        
        //这里才是显示倒计时的闪烁的时钟
        //倒计时处理
        //用的MZTimerLabel显示跳跃的时间
        timerExample1 = [[MZTimerLabel alloc] initWithLabel:self.timeLab andTimerType:MZTimerLabelTypeTimer];
        self.timeLab.tag = 222;
        [timerExample1 setCountDownTime:[[[NSDate alloc] intervalSinceNow:model.q_end_time] intValue]];
        timerExample1.resetTimerAfterFinish = YES;
        timerExample1.timeFormat = @"mm:ss:SS";
        if(![timerExample1 counting]){
            
            __weak newPublishWaitCell *wself = self;
            
            
            [timerExample1 startWithEndingBlock:^(NSTimeInterval countTime) {
                
                if ([[[NSDate alloc] intervalSinceNow:model.q_end_time] intValue] == 0) {
                    [self.timeLab removeFromSuperview];
                    UILabel *jxLab = self.timeLab = [[UILabel alloc]initWithFrame:CGRectMake(125, 50, 150, 34)];
                    jxLab.backgroundColor = [UIColor clearColor];
                    jxLab.textColor = [UIColor redColor];
                    jxLab.tag = 333;
                    jxLab.font = [UIFont systemFontOfSize:29];
                    jxLab.text = @"正在开奖";
                    [wself addSubview:jxLab];
                    [wself addSubview:self.timeLab];
                    
                    //开奖后刷新这个cell的数据
//                    wself.father.freshCount = 0;
//                    [wself.father reloadVCIndex:index];
                }
            }];
            
        }
    }
    

    

}

@end
