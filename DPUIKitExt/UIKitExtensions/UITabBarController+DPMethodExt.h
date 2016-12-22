//
//  UITabBarController+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp 

#import <UIKit/UIKit.h>

@interface UITabBarController (DPMethodExt)

/**
 创建UITabBarController，参数1为vc数组，参数2为标题数组，参数3为未选中状态图片名称数组，参数4为选中状态图片名称数组
 */
UITabBarController * DPTabBarController(NSArray *viewControllers, NSArray *titles, NSArray *unselectedImages, NSArray *selectedImages);

/**
 设置UITabBarItem图片偏移量
 */
- (UITabBarController *(^)(UIEdgeInsets))setTabBarImageInsets;

/**
 调整UITabBarItem标题偏移量
 */
- (UITabBarController *(^)(UIOffset))setTabBarTitlePositionAdjustment;

/**
 设置UITabBarItem标题颜色，参数1为颜色，参数2为tabbaritem选中状态
 */
- (UITabBarController *(^)(UIColor *, UIControlState))setTabBarTitleColor;

/**
 设置UITabBarItem标题字号，参数1为字号，参数2为tabbaritem选中状态
 */
- (UITabBarController *(^)(UIFont *, UIControlState))setTabBarTitleFont;

/**
 设置UITabBarItem标题富文本，参数1为富文本样式，参数2为tabbaritem选中状态
 */
- (UITabBarController *(^)(NSDictionary *, UIControlState))setTabBarTitleTextAttributes;

@end
