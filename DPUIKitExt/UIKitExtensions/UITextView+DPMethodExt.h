//
//  UITextView+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp

#import <UIKit/UIKit.h>

@interface UITextView (DPMethodExt)

@property (strong, nonatomic, readonly) UILabel *placeholderLabel; /**< 提示label */

/**
 创建UITextView

 @return UITextView
 */
UITextView * DPTextView();

/**
 设置frame
 */
- (UITextView *(^)(CGRect))setFrame;

/**
 设置背景颜色
 */
- (UITextView *(^)(UIColor *))setBackgroundColor;

/**
 设置代理
 */
- (UITextView *(^)(id))setDelegate;

/**
 设置文本
 */
- (UITextView *(^)(NSString *))setText;

/**
 设置文本颜色
 */
- (UITextView *(^)(UIColor *))setTextColor;

/**
 设置字体
 */
- (UITextView *(^)(UIFont *))setFont;

/**
 设置提示label坐标点
 */
- (UITextView *(^)(CGPoint))setPlaceholderLabelPoint;

/**
 设置提示文本
 */
- (UITextView *(^)(NSString *))setPlaceholderText;

/**
 设置提示文本颜色
 */
- (UITextView *(^)(UIColor *))setPlaceholderTextColor;

/**
 设置提示文本字号
 */
- (UITextView *(^)(UIFont *))setPlaceholderTextFont;

/**
 设置文本对齐方式
 */
- (UITextView *(^)(NSTextAlignment))setTextAlignment;

/**
 设置富文本
 */
- (UITextView *(^)(NSAttributedString *))setAttributedText;

/**
 设置内容偏移
 */
- (UITextView *(^)(UIEdgeInsets))setTextContainerInset;

/**
 设置是否能编辑
 */
- (UITextView *(^)(BOOL))setEditable;

/**
 设置是否能选中
 */
- (UITextView *(^)(BOOL))setSelectable;

/**
 设置自定义键盘
 */
- (UITextView *(^)(UIView *))setInputView;

/**
 设置键盘附加视图
 */
- (UITextView *(^)(UIView *))setInputAccessoryView;

/**
 设置键盘return按钮样式
 */
- (UITextView *(^)(UIReturnKeyType))setReturnKeyType;

/**
 设置键盘样式
 */
- (UITextView *(^)(UIKeyboardType))setKeyboardType;

@end
