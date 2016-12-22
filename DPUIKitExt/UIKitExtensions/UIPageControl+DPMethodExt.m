//
//  UIPageControl+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp

#import "UIPageControl+DPMethodExt.h"

@implementation UIPageControl (DPMethodExt)

UIPageControl * DPPageControl(){
    return [[UIPageControl alloc] init];
}

- (UIPageControl *(^)(CGRect))setFrame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIPageControl *(^)(NSInteger))setNumberOfPages{
    return ^(NSInteger pageCount){
        self.numberOfPages = pageCount;
        return self;
    };
}

- (UIPageControl *(^)(NSInteger))setCurrentPage{
    return ^(NSInteger page){
        self.currentPage = page;
        return self;
    };
}

- (UIPageControl *(^)(UIColor *))setPageIndicatorTintColor{
    return ^(UIColor *color){
        self.pageIndicatorTintColor = color;
        return self;
    };
}

- (UIPageControl *(^)(UIColor *))setCurrentPageIndicatorTintColor{
    return ^(UIColor *color){
        self.currentPageIndicatorTintColor = color;
        return self;
    };
}

@end
