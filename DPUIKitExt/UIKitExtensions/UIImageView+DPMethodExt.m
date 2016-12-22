//
//  UIImageView+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp

#import "UIImageView+DPMethodExt.h"

@implementation UIImageView (DPMethodExt)

UIImageView * DPImageView(){
    return [[UIImageView alloc] init].setBackgroundColor([UIColor whiteColor]);
}

- (UIImageView *(^)(CGRect))setFrame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIImageView *(^)(UIImage *))setImage{
    return ^(UIImage *image){
        self.image = image;
        return self;
    };
}

- (UIImageView *(^)(UIImage *))setHighlightedImage{
    return ^(UIImage *image){
        self.highlightedImage = image;
        return self;
    };
}

- (UIImageView *(^)(NSArray *))setAnimationImages{
    return ^(NSArray *imageList){
        self.animationImages = imageList;
        return self;
    };
}

- (UIImageView *(^)(NSArray *))setHighlightedAnimationImages{
    return ^(NSArray *imageList){
        self.highlightedAnimationImages = imageList;
        return self;
    };
}

- (UIImageView *(^)(NSTimeInterval))setAnimationDuration{
    return ^(NSTimeInterval duration){
        self.animationDuration = duration;
        return self;
    };
}

- (UIImageView *(^)(NSInteger))setAnimationRepeatCount{
    return ^(NSInteger repeatCount){
        self.animationRepeatCount = repeatCount;
        return self;
    };
}

- (UIImageView *(^)(BOOL))setHighlighted{
    return ^(BOOL isHighlighted){
        self.highlighted = isHighlighted;
        return self;
    };
}

- (UIImageView *(^)(UIColor *))setBackgroundColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (UIImageView *(^)(NSInteger))setTag{
    return ^(NSInteger tag){
        self.tag = tag;
        return self;
    };
}

- (UIImageView *(^)(id, SEL))addTapGesture{
    return ^(id target, SEL action){
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:action]];
        self.userInteractionEnabled = YES;
        return self;
    };
}

- (UIImageView *(^)(UIViewContentMode))setContentMode{
    return ^(UIViewContentMode contentMode){
        self.contentMode = contentMode;
        return self;
    };
}

@end
