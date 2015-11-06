//
//  MDTextField.h
//  FlyKiteMaterialDesignLibrary
//
//  Created by qianfeng on 15/8/20.
//  Copyright (c) 2015年 Doge Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDTextField : UITextField
@property UILabel *label;
- (void) setLabelText:(NSString *)string;
- (void) setUnderlineColorOnFocus:(UIColor *)color;
@end
