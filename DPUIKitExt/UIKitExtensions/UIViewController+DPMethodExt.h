//
//  UIViewController+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp

#import <UIKit/UIKit.h>

@interface UIViewController (DPMethodExt)

#pragma mark - ↓↓↓↓↓↓动态透明导航↓↓↓↓↓↓
@property (strong, nonatomic) UIView *nav_topView;
@property (assign, nonatomic) CGFloat navbarAlpha;
@property (assign, nonatomic) CGFloat hiddenNavbarOffset;

- (void)setTransparentNavWithScrollView:(UIScrollView *)scrollView hiddenNavbarOffset:(CGFloat)hiddenNavbarOffset;
- (void)viewWillAppear_transparentNav;
- (void)viewDidAppear_transparentNav;
- (void)viewWillDisappear_transparentNav;
- (void)removeTransparentNavObserver;
#pragma mark - ↑↑↑↑↑↑动态透明导航↑↑↑↑↑↑

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

/**
 push到下一个页面
 */
- (void (^)(UIViewController *, BOOL))pushViewController;

/**
 pop回上一个页面
 */
- (void (^)(BOOL))popViewController;

/**
 pop回根视图
 */
- (void (^)(BOOL))popToRootViewController;

/**
 pop到指定的控制器
 */
- (void (^)(NSInteger, BOOL))popViewControllerWithIndex;

- (void (^)(UIViewController *, BOOL, void (^)()))presentViewController;

- (void (^)(BOOL, void (^)()))dismissViewController;


@end
