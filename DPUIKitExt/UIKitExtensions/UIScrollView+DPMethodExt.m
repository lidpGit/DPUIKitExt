//
//  UIScrollView+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp

#import "UIScrollView+DPMethodExt.h"

@implementation UIScrollView (DPMethodExt)

UIScrollView * DPScrollView(){
    return [[UIScrollView alloc] init];
}

- (UIScrollView *(^)(CGRect))setFrame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIScrollView *(^)(UIColor *))setBackgroundColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (UIScrollView *(^)(CGPoint, BOOL))setContentOffset{
    return ^(CGPoint point, BOOL animated){
        [self setContentOffset:point animated:animated];
        return self;
    };
}

- (UIScrollView *(^)(CGSize))setContentSize{
    return ^(CGSize size){
        self.contentSize = size;
        return self;
    };
}

- (UIScrollView *(^)(UIEdgeInsets))setContentInset{
    return ^(UIEdgeInsets insets){
        self.contentInset = insets;
        return self;
    };
}

- (UIScrollView *(^)(id))setDelegate{
    return ^(id target){
        self.delegate = target;
        return self;
    };
}

- (UIScrollView *(^)(BOOL))setBounces{
    return ^(BOOL bounces){
        self.bounces = bounces;
        return self;
    };
}

- (UIScrollView *(^)(BOOL))setAlwaysBounceVertical{
    return ^(BOOL bounces){
        self.alwaysBounceVertical = bounces;
        return self;
    };
}

- (UIScrollView *(^)(BOOL))setAlwaysBounceHorizontal{
    return ^(BOOL bounces){
        self.alwaysBounceHorizontal = bounces;
        return self;
    };
}

- (UIScrollView *(^)(BOOL))setPagingEnabled{
    return ^(BOOL enabled){
        self.pagingEnabled = enabled;
        return self;
    };
}

- (UIScrollView *(^)(BOOL))setScrollEnabled{
    return ^(BOOL enabled){
        self.scrollEnabled = enabled;
        return self;
    };
}

- (UIScrollView *(^)(BOOL))showsVerticalScrollIndicator{
    return ^(BOOL isShow){
        self.showsVerticalScrollIndicator = isShow;
        return self;
    };
}

- (UIScrollView *(^)(BOOL))showsHorizontalScrollIndicator{
    return ^(BOOL isShow){
        self.showsHorizontalScrollIndicator = isShow;
        return self;
    };
}

- (UIScrollView *(^)(CGRect, BOOL))scrollRectToVisible{
    return ^(CGRect frame, BOOL animated){
        [self scrollRectToVisible:frame animated:animated];
        return self;
    };
}

- (UIScrollView *(^)(CGFloat))setMaximumZoomScale{
    return ^(CGFloat scale){
        self.maximumZoomScale = scale;
        return self;
    };
}

- (UIScrollView *(^)(CGFloat))setMinimumZoomScale{
    return ^(CGFloat scale){
        self.minimumZoomScale = scale;
        return self;
    };
}

- (UIScrollView *(^)(CGFloat, BOOL))setZoomScale{
    return ^(CGFloat scale, BOOL animated){
        [self setZoomScale:scale animated:animated];
        return self;
    };
}

- (UIScrollView *(^)(CGRect, BOOL))zoomToRect{
    return ^(CGRect frame, BOOL animated){
        [self zoomToRect:frame animated:animated];
        return self;
    };
}

@end
