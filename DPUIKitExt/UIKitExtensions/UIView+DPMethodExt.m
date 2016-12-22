//
//  UIView+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp 

#import "UIView+DPMethodExt.h"

@implementation UIView (DPMethodExt)

UIView * DPView(){
    return [[UIView alloc] init];
}

- (CGFloat)viewWidth{
    return self.frame.size.width;
}

- (CGFloat)viewHeight{
    return self.frame.size.height;
}

- (CGSize)viewSize{
    return self.frame.size;
}

- (CGFloat)viewX{
    return self.frame.origin.x;
}

- (CGFloat)viewY{
    return self.frame.origin.y;
}

- (CGPoint)viewPoint{
    return self.frame.origin;
}

- (CGFloat)centerX{
    return self.center.x;
}

- (CGFloat)centerY{
    return self.center.y;
}

- (CGFloat)viewMaxX{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)viewMaxY{
    return CGRectGetMaxY(self.frame);
}

- (UIView *(^)(CGFloat))setViewWidth{
    return ^(CGFloat width){
        CGRect frame = self.frame;
        frame.size.width = width;
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGFloat))setViewHeight{
    return ^(CGFloat height){
        CGRect frame = self.frame;
        frame.size.height = height;
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGSize))setViewSize{
    return ^(CGSize size){
        CGRect frame = self.frame;
        frame.size = size;
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGFloat))setViewX{
    return ^(CGFloat x){
        CGRect frame = self.frame;
        frame.origin.x = x;
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGFloat))setViewY{
    return ^(CGFloat y){
        CGRect frame = self.frame;
        frame.origin.y = y;
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGPoint))setViewPoint{
    return ^(CGPoint point){
        CGRect frame = self.frame;
        frame.origin = point;
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGRect))setFrame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGFloat))setCenterX{
    return ^(CGFloat centerX){
        self.center = CGPointMake(centerX, self.center.y);
        return self;
    };
}

- (UIView *(^)(CGFloat))setCenterY{
    return ^(CGFloat centerY){
        self.center = CGPointMake(self.center.x, centerY);
        return self;
    };
}

- (UIView *(^)(CGPoint))setCenter{
    return ^(CGPoint center){
        self.center = center;
        return self;
    };
}

- (UIView *(^)(UIColor *))setBackgroundColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (UIView *(^)(UIView *))addSubview{
    return ^(UIView *subview){
        [self addSubview:subview];
        return self;
    };
}

- (UIView *(^)(UIView *, UIView *))insertBelowSubview{
    return ^(UIView *insertView, UIView *belowView){
        [self insertSubview:insertView belowSubview:belowView];
        return self;
    };
}

- (UIView *(^)(UIView *, UIView *))insertAboveSubview{
    return ^(UIView *insertView, UIView *aboveSubview){
        [self insertSubview:insertView aboveSubview:aboveSubview];
        return self;
    };
}

- (UIView *(^)(NSInteger))setTag{
    return ^(NSInteger tag){
        self.tag = tag;
        return self;
    };
}

- (UIView *(^)(CGFloat))setAlpha{
    return ^(CGFloat alpha){
        self.alpha = alpha;
        return self;
    };
}

- (UIView *(^)(BOOL))setUserInteractionEnabled{
    return ^(BOOL enabled){
        self.userInteractionEnabled = enabled;
        return self;
    };
}

- (UIView *(^)(CGAffineTransform))setTransform{
    return ^(CGAffineTransform transform){
        self.transform = transform;
        return self;
    };
}

- (UIView *(^)(BOOL))setAutoresizesSubviews{
    return ^(BOOL autoresizesSubviews){
        self.autoresizesSubviews = autoresizesSubviews;
        return self;
    };
}

- (UIView *(^)(UIViewAutoresizing))setAutoresizingMask{
    return ^(UIViewAutoresizing autoresizingMask){
        self.autoresizingMask = autoresizingMask;
        return self;
    };
}

- (UIView *(^)(CGFloat))setCornerRadius{
    return ^(CGFloat radius){
        self.layer.cornerRadius = radius;
        return self;
    };
}

- (UIView *(^)(CGFloat, UIColor *))setBorderStyle{
    return ^(CGFloat borderWidth, UIColor *borderColor){
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = borderColor.CGColor;
        return self;
    };
}

- (UIView *(^)(UIColor *, CGFloat, CGSize))setShadowStyle{
    return ^(UIColor *shadowColor, CGFloat opacity, CGSize offset){
        self.layer.shadowColor = shadowColor.CGColor;
        self.layer.shadowOpacity = opacity;
        self.layer.shadowOffset = offset;
        return self;
    };
}

- (void (^)(BOOL))endEditing{
    return ^(BOOL isEnd){
        [self endEditing:isEnd];
    };
}

@end
