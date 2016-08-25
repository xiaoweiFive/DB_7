//
//  SeachView.m
//  夺宝吧
//
//  Created by xiaocai on 15/6/17.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "SeachView.h"
#import "AppDelegate.h"
@interface SeachView ()<UITextFieldDelegate>
{
    //定位条
    __weak IBOutlet UILabel *locationView;
    __weak IBOutlet UIButton *cancelBtn;
    __weak IBOutlet UIButton *newSeachBtn;
    __weak IBOutlet UIButton *hotSeachBtn;
    __weak IBOutlet UITextField *inputTextView;
    
    __weak IBOutlet UIImageView *bgimg;
}
@end
@implementation SeachView

//入口函数
- (void)awakeFromNib
{
    self.frame = CGRectMake(0, 0, WYMWITH, self.frame.size.height);
    [newSeachBtn setTitleColor:QBB_RED_COLOR forState:UIControlStateSelected];
    [hotSeachBtn setTitleColor:QBB_RED_COLOR forState:UIControlStateSelected];
    self.frame = CGRectMake(0, 20, self.frame.size.width, self.frame.size.height);
    [inputTextView becomeFirstResponder];
    inputTextView.delegate = self;
    bgimg.layer.borderWidth = 1;
    bgimg.layer.borderColor = [UIColor lightGrayColor].CGColor;
    bgimg.layer.cornerRadius = 2;
    bgimg.layer.masksToBounds = YES;
}

//取消按钮监听
- (IBAction)cancelBtnOnCLick:(UIButton *)sender {
    
    [self.father dismissViewControllerAnimated:YES completion:nil];
}

//最新搜索
- (IBAction)newBtnOnCLick:(id)sender {
    newSeachBtn.selected = YES;
    hotSeachBtn.selected = NO;
    [self.father.view endEditing:YES];
    [UIView animateWithDuration:0.20 animations:^{
       locationView.frame = CGRectMake(0, locationView.frame.origin.y, locationView.frame.size.width, locationView.frame.size.height);
    }];
    [self.father changeoffsetByIndex:0];
}

//热门搜索
- (IBAction)hotBtnOnClick:(id)sender {
    newSeachBtn.selected = NO;
    hotSeachBtn.selected = YES;
    [self.father.view endEditing:YES];
    [UIView animateWithDuration:0.20 animations:^{
        locationView.frame = CGRectMake(CGRectGetMinX(hotSeachBtn.frame), locationView.frame.origin.y, locationView.frame.size.width, locationView.frame.size.height);
    }];
    [self.father changeoffsetByIndex:1];
}
//键盘确定按钮的点击事件
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (inputTextView.text.length != 0) {
        [self.father dismissViewControllerAnimated:YES completion:^{
            [[WYMainTabBarVC shareMainTaBarVC]seachBtnOnClick:inputTextView.text];
            //保存搜索
            [[WYDataBase sharedDataBase]insertSeachText:inputTextView.text];
            [[WYMainTabBarVC shareMainTaBarVC]changeSelectedWithIndex:0];
        }];
    }else{
        UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"温馨提示：" message:@"请输入您要搜索的内容！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alt show];
    }
    
    return YES;
}
//改变定位条的位置
- (void)changeOffetOfLocationViewWithIndex:(NSInteger)index
{
    if (index == 0) {
        newSeachBtn.selected = YES;
        hotSeachBtn.selected = NO;
    }else{
        newSeachBtn.selected = NO;
        hotSeachBtn.selected = YES;
    }
    [UIView animateWithDuration:0.20 animations:^{
        locationView.frame = CGRectMake(CGRectGetMinX(hotSeachBtn.frame)*index, locationView.frame.origin.y, locationView.frame.size.width, locationView.frame.size.height);
    }];
}

//改变输入框的值
- (void)changeInputText:(NSString *)text
{
    inputTextView.text = text;
}
@end
