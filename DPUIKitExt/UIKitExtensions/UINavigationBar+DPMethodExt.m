//
//  UINavigationBar+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp 

#import "UINavigationBar+DPMethodExt.h"
#import <objc/runtime.h>

const void *key_nav_bg_color = "dp_nav_bg_color";
const void *key_nav_hidden_line = "dp_nav_hidden_line";

@implementation UINavigationBar (DPMethodExt)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod(self.class, @selector(layoutSubviews));
        Method swizzledMethod = class_getInstanceMethod(self.class, @selector(dp_layoutSubviews));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

- (UINavigationBar *(^)(BOOL))setTranslucent{
    return ^(BOOL isTranslucent){
        self.translucent = isTranslucent;
        return self;
    };
}

- (BOOL)isHiddenShadowImage{
    return [objc_getAssociatedObject(self, key_nav_hidden_line) boolValue];
}

- (UINavigationBar *(^)(BOOL))setHiddenShadowImage{
    return ^(BOOL isHidden){
        objc_setAssociatedObject(self, key_nav_hidden_line, @(isHidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self setNeedsLayout];
        return self;
    };
}

- (UINavigationBar *(^)(UIImage *))setShadowImage{
    return ^(UIImage *shadowImage){
        self.shadowImage = shadowImage;
        return self;
    };
}

- (UINavigationBar *(^)(UIImage *))setBackgroundImage{
    return ^(UIImage *bgImage){
        [self setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
        return self;
    };
}

- (UINavigationBar *(^)(UIColor *))setBackgroundColor{
    return ^(UIColor *bgColor) {
        objc_setAssociatedObject(self, key_nav_bg_color, bgColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self setNeedsLayout];
        return self;
    };
}

- (UINavigationBar *(^)(UIColor *))setTitleColor{
    return ^(UIColor *color){
        NSMutableDictionary *attrDict = [NSMutableDictionary dictionaryWithDictionary:self.titleTextAttributes];
        attrDict[NSForegroundColorAttributeName] = color;
        self.titleTextAttributes = attrDict;
        return self;
    };
}

- (UINavigationBar *(^)(UIFont *))setFont{
    return ^(UIFont *font){
        NSMutableDictionary *attrDict = [NSMutableDictionary dictionaryWithDictionary:self.titleTextAttributes];
        attrDict[NSFontAttributeName] = font;
        self.titleTextAttributes = attrDict;
        return self;
    };
}

- (UINavigationBar *(^)(NSDictionary *))setTextAttributes{
    return ^(NSDictionary *attrDict){
        self.titleTextAttributes = attrDict;
        return self;
    };
}

- (void)dp_layoutSubviews{
    [self dp_layoutSubviews];
    for (id obj in self.subviews) {
        UIView *shadowSuperview = nil;
        if ([UIDevice currentDevice].systemVersion.floatValue >= 10.0f) {
            if ([obj isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
                shadowSuperview = obj;
            }
        }else{
            if ([obj isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
                shadowSuperview = obj;
            }
        }
        
        if (shadowSuperview) {
            UIColor *bgColor = objc_getAssociatedObject(self, key_nav_bg_color);
            if (bgColor) {
                shadowSuperview.backgroundColor = bgColor;
            }
            
            BOOL isHidden = [objc_getAssociatedObject(self, key_nav_hidden_line) boolValue];
            for (UIImageView *subview in [obj subviews]) {
                if ([subview isMemberOfClass:[UIImageView class]] && subview.frame.size.height == 0.5) {
                    subview.image = self.shadowImage;
                    subview.hidden = isHidden;
                }
            }
        }
    }
}

@end

@implementation UINavigationItem (DPMethodExt)

- (UINavigationItem *(^)(NSString *))setTitle{
    return ^(NSString *title){
        self.title = title;
        return self;
    };
}

- (UINavigationItem *(^)(UIBarButtonItem *))setLeftItem{
    return ^(UIBarButtonItem *item){
        self.leftBarButtonItem = item;
        return self;
    };
}

- (UINavigationItem *(^)(NSArray *))setLeftItems{
    return ^(NSArray *items){
        self.leftBarButtonItems = items;
        return self;
    };
}

- (UINavigationItem *(^)(UIBarButtonItem *))setRightItem{
    return ^(UIBarButtonItem *item){
        self.rightBarButtonItem = item;
        return self;
    };
}

- (UINavigationItem *(^)(NSArray *))setRightItems{
    return ^(NSArray *items){
        self.rightBarButtonItems = items;
        return self;
    };
}

@end

@implementation UIBarButtonItem (DPMethodExt)

UIBarButtonItem * DPTitleBarButtonItem(NSString *title){
    return [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:nil action:nil];
}

UIBarButtonItem * DPImageBarButtonItem(UIImage *image){
    return [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:nil action:nil];
}

UIBarButtonItem * DPSpacingBarButtonItem(CGFloat spacing){
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    item.width = spacing;
    return item;
}

- (UIBarButtonItem *(^)(id, SEL))addAction{
    return ^(id target, SEL action){
        self.target = target;
        self.action = action;
        return self;
    };
}

- (UIBarButtonItem *(^)(NSString *))setTitle{
    return ^(NSString *title){
        self.title = title;
        return self;
    };
}

- (UIBarButtonItem *(^)(UIColor *, UIControlState))setTitleColor{
    return ^(UIColor *color, UIControlState state){
        NSMutableDictionary *styleDict = [NSMutableDictionary dictionaryWithDictionary:[self titleTextAttributesForState:state]];
        styleDict[NSForegroundColorAttributeName] = color;
        [self setTitleTextAttributes:styleDict forState:state];
        return self;
    };
}

- (UIBarButtonItem *(^)(UIFont *, UIControlState))setFont{
    return ^(UIFont *font, UIControlState state){
        NSMutableDictionary *styleDict = [NSMutableDictionary dictionaryWithDictionary:[self titleTextAttributesForState:state]];
        styleDict[NSFontAttributeName] = font;
        [self setTitleTextAttributes:styleDict forState:state];
        return self;
    };
}

@end
