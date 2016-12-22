//
//  UITabBar+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp 

#import <UIKit/UIKit.h>

@interface UITabBar (DPMethodExt)

@property (assign, nonatomic, readonly) BOOL isHiddenShadowImage; /**< 是否隐藏分割线 */

/**
 是否半透明
 */
- (UITabBar *(^)(BOOL))setTranslucent;

/**
 是否隐藏分割线
 */
- (UITabBar *(^)(BOOL))setHiddenShadowImage;

/**
 设置分割线
 */
- (UITabBar *(^)(UIImage *))setShadowImage;

/**
 设置背景图片
 */
- (UITabBar *(^)(UIImage *))setBackgrondImage;

@end

@interface UITabBarItem (DPMethodExt)

/**
 创建tabbarItem，参数1为标题，参数2为未选中状态图片，参数3为选中状态图片
 */
UITabBarItem * DPTabBarItem(NSString *title, UIImage *unselectedImage, UIImage *selectedImage);

/**
 设置图片偏移量
 */
- (UITabBarItem *(^)(UIEdgeInsets))setImageInsets;

/**
 调整标题偏移量
 */
- (UITabBarItem *(^)(UIOffset))setTitlePositionAdjustment;

/**
 设置标题颜色，参数1为颜色，参数2为tabbaritem选中状态
 */
- (UITabBarItem *(^)(UIColor *, UIControlState))setTitleColor;

/**
 设置标题字号，参数1为字号，参数2为tabbaritem选中状态
 */
- (UITabBarItem *(^)(UIFont *, UIControlState))setTitleFont;

/**
 设置标题富文本，参数1为富文本样式，参数2为tabbaritem选中状态
 */
- (UITabBarItem *(^)(NSDictionary *, UIControlState))setTitleTextAttributes;

@end
