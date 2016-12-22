//
//  UITextField+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp 

#import <UIKit/UIKit.h>

@interface UITextField (DPMethodExt)

/**
 创建UITextField

 @return UITextField
 */
UITextField * DPTextField();

/**
 设置frame
 */
- (UITextField *(^)(CGRect))setFrame;

/**
 设置背景颜色
 */
- (UITextField *(^)(UIColor *color))setBackgroundColor;

/**
 设置文本
 */
- (UITextField *(^)(NSString *))setText;

/**
 设置提示文本
 */
- (UITextField *(^)(NSString *))setPlaceholder;

/**
 设置字体
 */
- (UITextField *(^)(UIFont *))setFont;

/**
 设置文本颜色
 */
- (UITextField *(^)(UIColor *color))setTextColor;

/**
 设置文本对齐方式
 */
- (UITextField *(^)(NSTextAlignment))setTextAlignment;

/**
 设置输入框边框样式
 */
- (UITextField *(^)(UITextBorderStyle))setBorderStyle;

/**
 设置代理
 */
- (UITextField *(^)(id))setDelegate;

/**
 设置清除按钮出现模式
 */
- (UITextField *(^)(UITextFieldViewMode))setClearButtonMode;

/**
 设置文本框左边附加视图及出现方式
 */
- (UITextField *(^)(UIView *, UITextFieldViewMode))setLeftView;

/**
 设置文本框右边附加视图及出现方式
 */
- (UITextField *(^)(UIView *, UITextFieldViewMode))setRightView;

/**
 设置自定义键盘
 */
- (UITextField *(^)(UIView *))setInputView;

/**
 设置键盘附加视图
 */
- (UITextField *(^)(UIView *))setInputAccessoryView;

/**
 设置键盘return按钮样式
 */
- (UITextField *(^)(UIReturnKeyType))setReturnKeyType;

/**
 设置键盘样式
 */
- (UITextField *(^)(UIKeyboardType))setKeyboardType;

@end
