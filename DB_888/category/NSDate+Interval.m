//
//  NSDate+Interval.m
//  DB_888
//
//  Created by zhangzhenwei on 16/8/29.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "NSDate+Interval.h"
#import "NSDateFormatter+Category.h"


@implementation NSDate (Interval)

- (NSString *)intervalStringFromNow
{
    NSUInteger unitFlags = NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
    NSDateComponents *difference = [[NSCalendar currentCalendar] components:unitFlags
                                                                   fromDate:[NSDate date]
                                                                     toDate:self
                                                                    options:0];
    
    NSInteger days = [difference day];
    if (days>0) {
        return [@"" stringByAppendingFormat:@"%ld天",days];
    }
    
    NSInteger hour = [difference hour];
    if (hour>0) {
        return [@"" stringByAppendingFormat:@"%ld小时",hour];
    }
    
    NSInteger minute = [difference minute];
    if (minute>0) {
        return [@"" stringByAppendingFormat:@"%ld分钟",minute];
    }
    
    NSInteger second = [difference second];
    if (second>0) {
        return [@"" stringByAppendingFormat:@"%ld秒",second];
    }
    
    return @"";
}

- (NSString *)timeIntervalDescription
{
    NSTimeInterval timeInterval = -[self timeIntervalSinceNow];
    if (timeInterval < 60) {
        return @"1分钟内";
    } else if (timeInterval < 3600) {
        return [NSString stringWithFormat:@"%.f分钟前", timeInterval / 60];
    } else if (timeInterval < 86400) {
        return [NSString stringWithFormat:@"%.f小时前", timeInterval / 3600];
    } else if (timeInterval < 2592000) {//30天内
        return [NSString stringWithFormat:@"%.f天前", timeInterval / 86400];
    } else if (timeInterval < 31536000) {//30天至1年内
        NSDateFormatter *dateFormatter = [NSDateFormatter dateFormatterWithFormat:@"M月d日"];
        return [dateFormatter stringFromDate:self];
    } else {
        return [NSString stringWithFormat:@"%.f年前", timeInterval / 31536000];
    }
}

- (NSString *)intervalSinceNow:(NSString *) theDate // 时间差，精确到秒
{
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d=[date dateFromString:theDate];
    
    NSTimeInterval late=[d  timeIntervalSince1970]*1;
    
    
    NSDate* dat = [NSDate date];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    
    NSTimeInterval cha=now-late;
    timeString=[NSString stringWithFormat:@"%.0f",cha];
    MYLog(@"%@",timeString);
    
    //
    //    if (cha/3600<1) {
    //        timeString = [NSString stringWithFormat:@"%f", cha];
    //        timeString = [timeString substringToIndex:timeString.length-7];
    //        timeString=[NSString stringWithFormat:@"%@秒前", timeString];
    //
    //    }
    //
    //    if (cha/3600<1) {
    //        timeString = [NSString stringWithFormat:@"%f", cha/60];
    //        timeString = [timeString substringToIndex:timeString.length-7];
    //        timeString=[NSString stringWithFormat:@"%@分钟前", timeString];
    //
    //    }
    //    if (cha/3600>1&&cha/86400<1) {
    //        timeString = [NSString stringWithFormat:@"%f", cha/3600];
    //        timeString = [timeString substringToIndex:timeString.length-7];
    //        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
    //    }
    //    if (cha/86400>1)
    //    {
    //        timeString = [NSString stringWithFormat:@"%f", cha/86400];
    //        timeString = [timeString substringToIndex:timeString.length-7];
    //        timeString=[NSString stringWithFormat:@"%@天前", timeString];
    //    }
    return timeString;
}


@end
