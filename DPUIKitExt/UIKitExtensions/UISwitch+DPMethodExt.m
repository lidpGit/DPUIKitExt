//
//  UISwitch+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp

#import "UISwitch+DPMethodExt.h"

@implementation UISwitch (DPMethodExt)

UISwitch * DPSwitch(CGRect frame){
    return [[UISwitch alloc] initWithFrame:frame];
}

- (UISwitch *(^)(CGRect))setFrame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UISwitch *(^)(UIColor *))setOnTintColor{
    return ^(UIColor *color){
        self.onTintColor = color;
        return self;
    };
}

- (UISwitch *(^)(UIColor *))setTintColor{
    return ^(UIColor *color){
        self.tintColor = color;
        return self;
    };
}

- (UISwitch *(^)(UIColor *))setThumbTintColor{
    return ^(UIColor *color){
        self.thumbTintColor = color;
        return self;
    };
}

- (UISwitch *(^)(UIImage *))setOnImage{
    return ^(UIImage *image){
        self.onImage = image;
        return self;
    };
}

- (UISwitch *(^)(UIImage *))setOffImage{
    return ^(UIImage *image){
        self.offImage = image;
        return self;
    };
}

- (UISwitch *(^)(BOOL, BOOL))setOn{
    return ^(BOOL isOn, BOOL animated){
        [self setOn:isOn animated:animated];
        return self;
    };
}

@end
