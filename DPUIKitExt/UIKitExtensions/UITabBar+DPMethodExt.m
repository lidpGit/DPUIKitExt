//
//  UITabBar+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp

#import "UITabBar+DPMethodExt.h"
#import <objc/runtime.h>

const void *key_tabbar_hidden_line = "dp_tabbar_hidden_line";

@implementation UITabBar (DPMethodExt)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod(self.class, @selector(layoutSubviews));
        Method swizzledMethod = class_getInstanceMethod(self.class, @selector(dp_layoutSubviews));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

- (UITabBar *(^)(BOOL))setTranslucent{
    return ^(BOOL translucent){
        self.translucent = translucent;
        return self;
    };
}

- (BOOL)isHiddenShadowImage{
    return [objc_getAssociatedObject(self, key_tabbar_hidden_line) boolValue];
}

- (UITabBar *(^)(BOOL))setHiddenShadowImage{
    return ^(BOOL isHidden){
        objc_setAssociatedObject(self, key_tabbar_hidden_line, @(isHidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self setNeedsLayout];
        return self;
    };
}

- (UITabBar *(^)(UIImage *))setShadowImage{
    return ^(UIImage *image){
        self.shadowImage = image;
        return self;
    };
}

- (UITabBar *(^)(UIImage *))setBackgrondImage{
    return ^(UIImage *image){
        self.backgroundImage = image;
        return self;
    };
}

- (void)dp_layoutSubviews{
    [self dp_layoutSubviews];
    BOOL isHidden = [objc_getAssociatedObject(self, key_tabbar_hidden_line) boolValue];
    
    for (id obj in self.subviews) {
        if ([UIDevice currentDevice].systemVersion.floatValue >= 10.0f) {
            if ([obj isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
                for (UIImageView *subview in [obj subviews]) {
                    if ([subview isMemberOfClass:[UIImageView class]] && subview.frame.size.height == 0.5) {
                        subview.image = self.shadowImage;
                        subview.hidden = isHidden;
                    }
                }
            }
        }else{
            UIImageView *subview = obj;
            if ([subview isMemberOfClass:[UIImageView class]] && subview.frame.size.height == 0.5) {
                subview.image = self.shadowImage;
                subview.hidden = isHidden;
            }
        }
    }
}

@end

@implementation UITabBarItem (DPMethodExt)

UITabBarItem * DPTabBarItem(NSString *title, UIImage *unselectedImage, UIImage *selectedImage){
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:unselectedImage selectedImage: selectedImage];
    item.selectedImage = [item.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item.image = [item.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return item;
}

- (UITabBarItem *(^)(UIEdgeInsets))setImageInsets{
    return ^(UIEdgeInsets insets){
        self.imageInsets = insets;
        return self;
    };
}

- (UITabBarItem *(^)(UIOffset))setTitlePositionAdjustment{
    return ^(UIOffset offset){
        self.titlePositionAdjustment = offset;
        return self;
    };
}

- (UITabBarItem *(^)(UIColor *, UIControlState))setTitleColor{
    return ^(UIColor *color, UIControlState state){
        NSMutableDictionary *attrDict = [NSMutableDictionary dictionaryWithDictionary:[self titleTextAttributesForState:state]];
        attrDict[NSForegroundColorAttributeName] = color;
        [self setTitleTextAttributes:attrDict forState:state];
        return self;
    };
}

- (UITabBarItem *(^)(UIFont *, UIControlState))setTitleFont{
    return ^(UIFont *font, UIControlState state){
        NSMutableDictionary *attrDict = [NSMutableDictionary dictionaryWithDictionary:[self titleTextAttributesForState:state]];
        attrDict[NSFontAttributeName] = font;
        [self setTitleTextAttributes:attrDict forState:state];
        return self;
    };
}

- (UITabBarItem *(^)(NSDictionary *, UIControlState))setTitleTextAttributes{
    return ^(NSDictionary *attrDict, UIControlState state){
        [self setTitleTextAttributes:attrDict forState:state];
        return self;
    };
}

@end
