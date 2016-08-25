//
//  UIBarButtonItem+myAdd.h
//  Zhang_tabBar
//
//  Created by zhangzhenwei on 16/8/19.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (myAdd)


+(UIBarButtonItem *)itemWithTarget:(id)target
                            action:(SEL)action
                              icon:(NSString *)icon
                    hightLightIcon:(NSString *)highlightedIcon;


+ (UIBarButtonItem *)barButtonItemWithIcon:(NSString *)icon
                                    target:(id)target
                                    action:(SEL)action;




+ (UIBarButtonItem *)barButtonItemWithBg:(NSString *)bg
                                   title:(NSString *)title
                                    size:(CGSize)size
                                  target:(id)target
                                  action:(SEL)action;

@end
