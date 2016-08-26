//
//  ZZWHttpTool.h
//  DB_888
//
//  Created by zhangzhenwei on 16/8/26.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^ZZWSuccess)(id json);
typedef void (^ZZWFailure)(NSError *error);

@interface ZZWHttpTool : NSObject


+ (void) get:(NSString *)url parameters:(NSDictionary *)parameters httpToolSuccess:(ZZWSuccess)httpToolSuccess failure:(ZZWFailure)httpToolFailure;

+ (void) get:(NSString *)url parameters:(NSDictionary *)parameters isShowHUD:(BOOL)showHUD httpToolSuccess:(ZZWSuccess)httpToolSuccess failure:(ZZWFailure)httpToolFailure;


+ (void)post:(NSString *)url parameters:(id )parameters httpToolSuccess:(ZZWSuccess)httpToolSuccess failure:(ZZWFailure)failure;

+ (void)post:(NSString *)url parameters:(id )parameters isShowHUD:(BOOL)showHUD httpToolSuccess:(ZZWSuccess)httpToolSuccess failure:(ZZWFailure)failure;



@end
