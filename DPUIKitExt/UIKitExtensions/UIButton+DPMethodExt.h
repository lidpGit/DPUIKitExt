//
//  UIButton+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp

#import <UIKit/UIKit.h>

/** 布局类型 */
typedef NS_ENUM(NSInteger, DPBtnLayoutType) {
    DPBtnLayoutTypeLeftImageRightTitle = 1,    /**< 图片在左，标题在右 */
    DPBtnLayoutTypeLeftTitleRightImage = 2,    /**< 标题在左，图片在右 */
    DPBtnLayoutTypeUpImageDownTitle    = 3,    /**< 图片在上，标题在下 */
    DPBtnLayoutTypeUpTitleDownImage    = 4,    /**< 标题在上，图片在下 */
};

@interface UIButton (DPMethodExt)

@property (assign, nonatomic, readonly) CGFloat imageTitleSpacing;    /**< 图片与文字间距 */
@property (assign, nonatomic, readonly) DPBtnLayoutType layoutType;    /**< 布局类型 */

/**
 创建UIButton

 @return UIButton
 */
UIButton * DPButton();

/**
 创建UIButton

 @param imageTitleSpacing 图片与文字间距
 @param type              布局类型

 @return UIButton
 */
UIButton * DPLayoutButton(CGFloat imageTitleSpacing, DPBtnLayoutType type);

/**
 设置frame
 */
- (UIButton *(^)(CGRect))setFrame;

/**
 添加点击事件
 */
- (UIButton *(^)(id, SEL))addClickAction;

/**
 添加事件
 */
- (UIButton *(^)(id, SEL, UIControlEvents))addAction;

/**
 设置默认状态图片
 */
- (UIButton *(^)(UIImage *))setNormalImage;

/**
 设置高亮状态图片
 */
- (UIButton *(^)(UIImage *))setHighlightImage;

/**
 设置选中状态图片
 */
- (UIButton *(^)(UIImage *))setSelectedImage;

/**
 获取按钮图片
 */
- (UIImage *(^)(UIControlState))getImage;

/**
 设置按钮标题
 参数1为按钮标题
 参数2为按钮状态
 */
- (UIButton *(^)(NSString *, UIControlState))setTitle;

/**
 设置标题富文本
 参数1为富文本
 参数2为按钮状态
 */
- (UIButton *(^)(NSAttributedString *, UIControlState))setAttributedTitle;

/**
 获取按钮标题
 */
- (NSString *(^)(UIControlState))getTitle;

/**
 设置按钮标题颜色
 参数1为颜色
 参数2为按钮状态
 */
- (UIButton *(^)(UIColor *, UIControlState))setTitleColor;

/**
 设置按钮字体
 */
- (UIButton *(^)(UIFont *))setTitleFont;

/**
 设置背景颜色
 参数1为颜色
 参数2为按钮状态
 */
- (UIButton *(^)(UIColor *, UIControlState))setBackgroundColor;

/**
 设置tag
 */
- (UIButton *(^)(NSInteger))setTag;

@end
