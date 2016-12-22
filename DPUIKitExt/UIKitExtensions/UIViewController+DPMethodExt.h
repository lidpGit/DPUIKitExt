//
//  UIViewController+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp

#import <UIKit/UIKit.h>

@interface UIViewController (DPMethodExt)

/**
 获取UINavigationBar
 */
- (UINavigationBar *(^)())dp_navigationBar;

/**
 获取UITabBar
 */
- (UITabBar *(^)())dp_tabBar;

/**
 获取UITabBarItem
 */
- (UITabBarItem *(^)())dp_tabBarItem;

- (void (^)(UIViewController *, BOOL))pushViewController;

- (void (^)(BOOL))popViewController;

- (void (^)(BOOL))popToRootViewController;

- (void (^)(UIViewController *, BOOL, void (^)()))presentViewController;

- (void (^)(BOOL, void (^)()))dismissViewController;

@end
