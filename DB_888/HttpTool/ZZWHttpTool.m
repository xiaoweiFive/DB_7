//
//  ZZWHttpTool.m
//  DB_888
//
//  Created by zhangzhenwei on 16/8/26.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import "ZZWHttpTool.h"
#import <AFNetworking/AFNetworking.h>
#import <AdSupport/AdSupport.h>


@implementation ZZWHttpTool




+ (void)get:(NSString *)url parameters:(NSDictionary *)parameters httpToolSuccess:(ZZWSuccess)httpToolSuccess failure:(ZZWFailure)failure
{
    
    AFHTTPSessionManager *manager = [self getAFHTTPRequestOperationManager];
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (httpToolSuccess) {
            httpToolSuccess(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
            [self failureOperation:task error:error];
        }
    }];
}



+ (void)post:(NSString *)url parameters:(id )parameters httpToolSuccess:(ZZWSuccess)httpToolSuccess failure:(ZZWFailure)failure{
    
    AFHTTPSessionManager *manager = [self getAFHTTPRequestOperationManager];
    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (httpToolSuccess) {
            httpToolSuccess(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
            [self failureOperation:task error:error];
        }
    }];
}



+ (AFHTTPSessionManager *)getAFHTTPRequestOperationManager
{
    MYLog(@"1.getAFHTTPRequestOperationManager");

    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 20.f;
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:config];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/plain",@"text/javascript",@"text/html",nil];
    manager.requestSerializer.timeoutInterval = 20.f;
    
    [manager.requestSerializer setValue:[self httpHeaderFieldString] forHTTPHeaderField:@"User-Agent"];
    return manager;
}



//http头
+ (NSString *)httpHeaderFieldString
{
    //设置请求头
    NSString *deviceModel = [UIDevice currentDevice].model;/***设备型号******/
    float iosBanben = [[[UIDevice currentDevice] systemVersion] floatValue];/*****系统版本********/
    /**********软件版本**********/
    //版本
    NSString *app_v = @"V1.0.0";
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app版本
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    if (app_Version != nil) {
        app_v = [NSString stringWithFormat:@"V%@",app_Version];
    }
    //唯一标示devicetoken
    NSString *uuid = @"";
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:@"IDFA"]) {
        uuid = [user objectForKey:@"IDFA"];
    }
    else
    {
        uuid = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
        [[NSUserDefaults standardUserDefaults] setObject:uuid forKey:@"IDFA"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    NSString *agent = [NSString stringWithFormat:@"api.dbba.cn/%@/iOS/%.2f/%@/%@",app_v,iosBanben,deviceModel,uuid];
    return agent;
}





+ (void)failureOperation:(NSURLSessionDataTask *)task error:(NSError *)error
{
    
//    [QSCHudView sharedQSCHudView].hidden = YES;
//    [[QSCHudView sharedQSCHudView] disMissHUD];
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
    NSInteger codes = httpResponse.statusCode;
    NSLog(@"status code: %li", (long)httpResponse.statusCode);
    NSLog(@"Response Fail. Error : %@",error.localizedDescription);
    
    if (codes == 422 || codes == 403 || codes == 404 || codes == 400) {
//        NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
//        if(data.length >0){
//            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//            NSString *str = json[@"error"];
//            [ProgressHUD showError:str];
//        }
    }
    else if(codes == 401)
    {
//        QSCAccount *account = [QSCAccountTool sharedQSCAccountTool].account;
//        if (account) {
//            if (![NSDate isValidTime:account.timestamps withSeconds:10]) {
//                MYLog(@"3.小token \n access_token%@ \n refresh_token%@",account.access_token,account.refresh_token);
//                NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//                [dict setValue:account.refresh_token forKey:@"refresh_token"];
//                [dict setValue:@"refresh_token" forKey:@"grant_type"];
//                [dict setValue:@"1" forKey:@"client_id"];
//                [dict setValue:@"OyzSVM1CZcvX0il9LBwN801lgWHuXsFf" forKey:@"client_secret"];
//                
//                [QSCHttpTool postToken:kQSCAccessToken parameters:dict httpToolSuccess:^(id json) {
//                    
//                    account.access_token = json[@"access_token"];
//                    account.refresh_token = json[@"refresh_token"];
//                    MYLog(@"4.（）失败换取新的kQSCAccessToken \n access_token%@ \n refresh_token%@",account.access_token,account.refresh_token);
//                    account.timestamps = [[[NSDate alloc]init] timestamp];
//                    [[QSCAccountTool sharedQSCAccountTool] saveAccount:account];
//                    
//                } failure:^(NSError *error) {
//                    //                    MYLog(@"errorinfo -%@",[error description]);
//                }];
//            }
//        }
    }else
    {
//        [[QSCHudView sharedQSCHudView] disMissHUD];
//        [QSCHudView createFailMsgHUDWithMsg:[self requestErrorControllWithErrorCode:error.code]];
        

        
    }
}



@end
