//
//  httpConfig.h
//  DB_888
//
//  Created by zhangzhenwei on 16/8/26.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#ifndef httpConfig_h
#define httpConfig_h

#ifdef DEBUG

#define BaseUrlPath @"https://1.dbba.cn/"

#else
#define BaseUrlPath @"https://1.dbba.cn/"

#endif

//请求广告图的链接

#define ZZW_AD_URL [NSString stringWithFormat:@"%@/api/ApiMisc/getSlides",BaseUrlPath]

//商品详情
#define ZZW_PUBLISH_URL [NSString stringWithFormat:@"%@/api/ApiGoods/getRevealList",BaseUrlPath]



#endif /* httpConfig_h */
