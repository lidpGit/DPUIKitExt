//
//  UINavigationBar+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp 

#import <UIKit/UIKit.h>

@interface UINavigationBar (DPMethodExt)

@property (assign, nonatomic, readonly) BOOL isHiddenShadowImage; /**< 是否隐藏分割线 */

/**
 是否半透明
 */
- (UINavigationBar *(^)(BOOL))setTranslucent;

/**
 是否隐藏分割线
 */
- (UINavigationBar *(^)(BOOL))setHiddenShadowImage;

/**
 设置分割线
 */
- (UINavigationBar *(^)(UIImage *))setShadowImage;

/**
 设置背景图片
 */
- (UINavigationBar *(^)(UIImage *))setBackgroundImage;

/**
 设置背景颜色
 */
- (UINavigationBar *(^)(UIColor *))setBackgroundColor;

/**
 设置字体颜色
 */
- (UINavigationBar *(^)(UIColor *))setTitleColor;

/**
 设置字号
 */
- (UINavigationBar *(^)(UIFont *))setFont;

/**
 设置多个文本样式
 */
- (UINavigationBar *(^)(NSDictionary *))setTextAttributes;

@end

@interface UINavigationItem (DPMethodExt)

/**
 设置标题
 */
- (UINavigationItem *(^)(NSString *))setTitle;

/**
 设置左导单个item
 */
- (UINavigationItem *(^)(UIBarButtonItem *))setLeftItem;

/**
 设置左导多个item
 */
- (UINavigationItem *(^)(NSArray *))setLeftItems;

/**
 设置右导单个item
 */
- (UINavigationItem *(^)(UIBarButtonItem *))setRightItem;

/**
 设置右导多个item
 */
- (UINavigationItem *(^)(NSArray *))setRightItems;

@end

@interface UIBarButtonItem (DPMethodExt)

/**
 创建item(标题)
 */
UIBarButtonItem * DPTitleBarButtonItem(NSString *title);

/**
 创建item(图片)
 */
UIBarButtonItem * DPImageBarButtonItem(UIImage *image);

/**
 创建item(占位)
 */
UIBarButtonItem * DPSpacingBarButtonItem(CGFloat spacing);

/**
 添加点击事件
 */
- (UIBarButtonItem *(^)(id, SEL))addAction;

/**
 设置标题
 */
- (UIBarButtonItem *(^)(NSString *))setTitle;

/**
 设置字体颜色
 */
- (UIBarButtonItem *(^)(UIColor *, UIControlState))setTitleColor;

/**
 设置字号
 */
- (UIBarButtonItem *(^)(UIFont *, UIControlState))setFont;

@end

