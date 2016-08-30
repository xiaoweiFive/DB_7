//
//  NSDate+Interval.h
//  DB_888
//
//  Created by zhangzhenwei on 16/8/29.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Interval)


- (NSString *)intervalStringFromNow;
- (NSString *)timeIntervalDescription;


//利用时间戳来准确计算某个时间点具现在的时间差
- (NSString *)intervalSinceNow: (NSString *) theDate;

@end
