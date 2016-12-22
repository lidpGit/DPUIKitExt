//
//  UIProgressView+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp

#import "UIProgressView+DPMethodExt.h"

@implementation UIProgressView (DPMethodExt)

UIProgressView * DPProgressViewWithFrame(CGRect frame){
    return [[UIProgressView alloc] initWithFrame:frame];
}

UIProgressView * DPProgressViewWithStyle(UIProgressViewStyle style){
    return [[UIProgressView alloc] initWithProgressViewStyle:style];
}

- (UIProgressView *(^)(CGRect))setFrame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIProgressView *(^)(UIProgressViewStyle))setProgressViewStyle{
    return ^(UIProgressViewStyle style){
        self.progressViewStyle = style;
        return self;
    };
}

- (UIProgressView *(^)(float, BOOL))setProgress{
    return ^(float progress, BOOL animated){
        [self setProgress:progress animated:animated];
        return self;
    };
}

- (UIProgressView *(^)(UIColor *))setProgressTintColor{
    return ^(UIColor *color){
        self.progressTintColor = color;
        return self;
    };
}

- (UIProgressView *(^)(UIColor *))setTrackTintColor{
    return ^(UIColor *color){
        self.trackTintColor = color;
        return self;
    };
}

- (UIProgressView *(^)(UIImage *))setProgressImage{
    return ^(UIImage *image){
        self.progressImage = image;
        return self;
    };
}

- (UIProgressView *(^)(UIImage *))setTrackImage{
    return ^(UIImage *image){
        self.trackImage = image;
        return self;
    };
}

@end
