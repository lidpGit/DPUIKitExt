//
//  UISearchBar+DPMethodExt.m
//
//  Created by lidp
//

#import "UISearchBar+DPMethodExt.h"
#import <objc/runtime.h>

const void *search_bar_bg_color = "search_bar_bg_color";

@implementation UISearchBar (DPMethodExt)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            Method originalMethod = class_getInstanceMethod(self.class, @selector(layoutSubviews));
            Method swizzledMethod = class_getInstanceMethod(self.class, @selector(dp_layoutSubviews));
            method_exchangeImplementations(originalMethod, swizzledMethod);
        });
    });
}

- (void)resetBackgroundColor:(UIColor *)backgroundColor{
    objc_setAssociatedObject(self, search_bar_bg_color, backgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setNeedsLayout];
}

- (void)dp_layoutSubviews{
    [self dp_layoutSubviews];
    UIColor *bgColor = objc_getAssociatedObject(self, search_bar_bg_color);
    if (bgColor) {
        for (UIView *view in self.subviews) {
            for (id subview in view.subviews) {
                if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                    [subview setImage:DPImageForColor(bgColor)];
                }
            }
        }
    }
}

- (void)clearBackgroundColor{
    if ([self respondsToSelector:@selector(setBarTintColor:)]) {
        if ([UIDevice currentDevice].systemVersion.floatValue >= 7.1f){
            //iOS7.1
            [[[[self.subviews objectAtIndex:0] subviews] objectAtIndex:0] removeFromSuperview];
        } else {
            //iOS7.0
            [self setBarTintColor:[UIColor clearColor]];
        }
    } else {
        //iOS7.0以下
        [[self.subviews objectAtIndex:0] removeFromSuperview];
    }
}

@end
