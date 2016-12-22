//
//  UITabBarController+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp 

#import "DPUIKitMethodExt.h"

@implementation UITabBarController (DPMethodExt)

UITabBarController * DPTabBarController(NSArray *viewControllers, NSArray *titles, NSArray *unselectedImages, NSArray *selectedImages){
    UITabBarController *tabbarVC = [[UITabBarController alloc] init];
    for (int i = 0; i < viewControllers.count; i++) {
        UIViewController *vc = viewControllers[i];
        UIImage *selectedImage = DPImageForName(selectedImages[i]);
        UIImage *unselectedImage = DPImageForName(unselectedImages[i]);
        vc.tabBarItem = DPTabBarItem(titles[i], unselectedImage, selectedImage);
    }
    tabbarVC.viewControllers = viewControllers;
    return tabbarVC;
}

- (UITabBarController *(^)(UIEdgeInsets))setTabBarImageInsets{
    return ^(UIEdgeInsets insets){
        for (UIViewController *vc in self.viewControllers) {
            vc.tabBarItem.setImageInsets(insets);
        }
        return self;
    };
}

- (UITabBarController *(^)(UIOffset))setTabBarTitlePositionAdjustment{
    return ^(UIOffset offset){
        for (UIViewController *vc in self.viewControllers) {
            vc.tabBarItem.setTitlePositionAdjustment(offset);
        }
        return self;
    };
}

- (UITabBarController *(^)(UIColor *, UIControlState))setTabBarTitleColor{
    return ^(UIColor *color, UIControlState state){
        for (UIViewController *vc in self.viewControllers) {
            vc.tabBarItem.setTitleColor(color, state);
        }
        return self;
    };
}

- (UITabBarController *(^)(UIFont *, UIControlState))setTabBarTitleFont{
    return ^(UIFont *font, UIControlState state){
        for (UIViewController *vc in self.viewControllers) {
            vc.tabBarItem.setTitleFont(font, state);
        }
        return self;
    };
}

- (UITabBarController *(^)(NSDictionary *, UIControlState))setTabBarTitleTextAttributes{
    return ^(NSDictionary *attrDict, UIControlState state){
        for (UIViewController *vc in self.viewControllers) {
            vc.tabBarItem.setTitleTextAttributes(attrDict, state);
        }
        return self;
    };
}

@end
