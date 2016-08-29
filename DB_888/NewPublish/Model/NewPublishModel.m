
//
//  NewPublishModel.m
//  DB_888
//
//  Created by zhangzhenwei on 16/8/29.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "NewPublishModel.h"

@implementation NewPublishModel

-(NSDictionary *)replacedkeyFromPropertyName
{
    return@{@"publishID": @"id", @"publishsDescription": @"description"};
}

@end
