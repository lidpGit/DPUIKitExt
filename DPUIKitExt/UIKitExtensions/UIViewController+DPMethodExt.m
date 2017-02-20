//
//  UIViewController+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp 

#import "UIViewController+DPMethodExt.h"
#import <objc/runtime.h>

const void *key_scrollview = "vc_main_view";

@implementation UIViewController (DPMethodExt)

#pragma mark - ↓↓↓↓↓↓动态透明导航↓↓↓↓↓↓
- (void)setNav_topView:(UIView *)nav_topView{
    if (nav_topView != self.nav_topView) {
        objc_setAssociatedObject(self, @selector(nav_topView), nav_topView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (UIView *)nav_topView{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setNavbarAlpha:(CGFloat)navbarAlpha{
    objc_setAssociatedObject(self, @selector(navbarAlpha), @(navbarAlpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)navbarAlpha{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setHiddenNavbarOffset:(CGFloat)hiddenNavbarOffset{
    objc_setAssociatedObject(self, @selector(hiddenNavbarOffset), @(hiddenNavbarOffset), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)hiddenNavbarOffset{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setTransparentNavWithScrollView:(UIScrollView *)scrollView hiddenNavbarOffset:(CGFloat)hiddenNavbarOffset{
    self.hiddenNavbarOffset = hiddenNavbarOffset;
    self.navbarAlpha = 0;
    
    if ([scrollView isKindOfClass:[UIScrollView class]]) {
        objc_setAssociatedObject(self, key_scrollview, scrollView, OBJC_ASSOCIATION_ASSIGN);
        scrollView.contentInset = UIEdgeInsetsMake(scrollView.contentInset.top + self.hiddenNavbarOffset, 0, 0, 0);
        [scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)viewWillAppear_transparentNav{
    [UIView animateWithDuration:0.25 animations:^{
        self.navigationController.navigationBar.alpha = 0;
    }];
}

- (void)viewDidAppear_transparentNav{
    self.navigationController.navigationBar.alpha = self.navbarAlpha;
}

- (void)viewWillDisappear_transparentNav{
    [UIView animateWithDuration:0.25 animations:^{
        self.navigationController.navigationBar.alpha = 1;
    }];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    UIScrollView *mainView = objc_getAssociatedObject(self, key_scrollview);
    if ([keyPath isEqualToString:@"contentOffset"] && object == mainView) {
        self.navbarAlpha = (mainView.contentOffset.y + mainView.contentInset.top) / self.hiddenNavbarOffset;
        self.navigationController.navigationBar.alpha = self.navbarAlpha;
        self.nav_topView.alpha = 1 - self.navbarAlpha;
    }
}

- (void)removeTransparentNavObserver{
    UIScrollView *mainView = objc_getAssociatedObject(self, key_scrollview);
    if (mainView) {
        [mainView removeObserver:self forKeyPath:@"contentOffset"];
    }
}
#pragma mark - ↑↑↑↑↑↑动态透明导航↑↑↑↑↑↑

- (UINavigationBar *(^)())dp_navigationBar{
    return ^(){
        return self.navigationController.navigationBar;
    };
}

- (UITabBar *(^)())dp_tabBar{
    return ^(){
        return self.tabBarController.tabBar;
    };
}

- (UITabBarItem *(^)())dp_tabBarItem{
    return ^(){
        if (self.navigationController) {
            return self.navigationController.tabBarItem;
        }
        return self.tabBarItem;
    };
}

- (void (^)(UIViewController *, BOOL))pushViewController{
    return ^(UIViewController *vc, BOOL animated){
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:animated];
    };
}

- (void (^)(BOOL))popViewController{
    return ^(BOOL animated){
        [self.navigationController popViewControllerAnimated:animated];
    };
}

- (void (^)(BOOL))popToRootViewController{
    return ^(BOOL animated){
        [self.navigationController popToRootViewControllerAnimated:animated];
    };
}

- (void (^)(UIViewController *, BOOL, void (^)()))presentViewController{
    return ^(UIViewController *vc, BOOL animated, void (^completion)()){
        [self presentViewController:vc animated:animated completion:completion];
    };
}

- (void (^)(BOOL, void (^)()))dismissViewController{
    return ^(BOOL animated, void (^completion)()){
        [self dismissViewControllerAnimated:animated completion:completion];
    };
}

@end
