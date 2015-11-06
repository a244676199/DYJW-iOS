//
//  SystemPanel.m
//  DYJW
//
//  Created by 风筝 on 15/11/3.
//  Copyright © 2015年 Doge Studio. All rights reserved.
//

#import "SystemPanel.h"
#import "MDFloatButton.h"
#import "MDColor.h"
#import "UserInfo.h"

#define Duration 0.8
#define Padding 16

@interface SystemPanel ()
@property (nonatomic, weak)UILabel *welcomeLabel;
@end

@implementation SystemPanel
- (void)willMoveToSuperview:(UIView *)newSuperview {
    self.frame = CGRectMake(Padding, Padding, newSuperview.frame.size.width - 2 * Padding, newSuperview.frame.size.height - 76);
//    self.layer.cornerRadius = 2;
//    self.layer.shadowColor = [MDColor grey500].CGColor;
//    self.layer.shadowOpacity = 0.75;
//    self.layer.shadowOffset = CGSizeMake(0, 2);
//    self.backgroundColor = [MDColor whiteColor];
    UserInfo *user = [UserInfo userInfo];
    self.welcomeLabel.text = [NSString stringWithFormat:@"%@，欢迎使用教务管理系统。", user.name];
    NSArray *title = @[@"成绩查询", @"个人课表", @"重修报名", @"教学计划"];
    for (int i = 0; i < 4; i++) {
        MDFloatButton *btn = [MDFloatButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:title[i] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 20 + Padding * (i + 1) + 48 * i, self.frame.size.width, 48);
        btn.tag = i + 1;
        [self addSubview:btn];
    }
}

- (UILabel *)welcomeLabel {
    if (!_welcomeLabel) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
        label.textColor = [MDColor grey600];
        [self addSubview:label];
        _welcomeLabel = label;
    }
    return _welcomeLabel;
}

- (void)show {
    CGRect frame = self.frame;
    frame.origin.y = -frame.size.height;
    self.frame = frame;
    self.alpha = 0;
    self.hidden = NO;
    [UIView animateWithDuration:Duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect frame = self.frame;
        frame.origin.y = Padding;
        self.frame = frame;
        self.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hide {
    CGRect frame = self.frame;
    frame.origin.y = Padding;
    self.frame = frame;
    self.alpha = 1;
    [UIView animateWithDuration:Duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect frame = self.frame;
        frame.origin.y = frame.size.height;
        self.frame = frame;
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
