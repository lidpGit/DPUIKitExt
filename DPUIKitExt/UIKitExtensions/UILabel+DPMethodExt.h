//
//  UILabel+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp 

#import <UIKit/UIKit.h>


@interface UILabel (DPMethodExt)

/**
 创建UILabel

 @return UILabel
 */
UILabel * DPLabel();

/**
 设置frame
 */
- (UILabel *(^)(CGRect))setFrame;

/**
 设置label最大宽度，多行label时使用
 */
- (UILabel *(^)(CGFloat))setMaxWidth;

/**
 设置文本
 */
- (UILabel *(^)(NSString *))setText;

/**
 设置字体
 */
- (UILabel *(^)(UIFont *))setFont;

/**
 设置文本颜色
 */
- (UILabel *(^)(UIColor *))setTextColor;

/**
 设置对齐方式
 */
- (UILabel *(^)(NSTextAlignment))setTextAlignment;

/**
 设置富文本
 */
- (UILabel *(^)(NSAttributedString *))setAttributeString;

/**
 设置背景颜色
 */
- (UILabel *(^)(UIColor *))setBackgroundColor;

/**
 设置文本显示行数
 */
- (UILabel *(^)(NSInteger))setLine;

/**
 设置tag值
 */
- (UILabel *(^)(NSInteger))setTag;

/**
 设置是否允许交互
 */
- (UILabel *(^)(BOOL))setUserInteractionEnabled;

/**
 设置行间距
 */
- (UILabel *(^)(CGFloat))setLineSpacing;

/**
 设置字符间距
 */
- (UILabel *(^)(CGFloat))setCharacterSpacing;

/**
 设置不同范围的文本颜色
 参数1为范围
 参数2为颜色
 */
- (UILabel *(^)(NSRange, UIColor *))setSpanColor;

/**
 设置首行缩进
 */
- (UILabel *(^)(CGFloat))setFirstLineHeadIndent;

/**
 设置阴影
 参数1为阴影颜色
 参数2为阴影偏移量
 */
- (UILabel *(^)(UIColor *, CGSize))setShadow;

@end
