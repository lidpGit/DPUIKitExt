//
//  UIViewController+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp 

#import "UIViewController+DPMethodExt.h"

@implementation UIViewController (DPMethodExt)

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
