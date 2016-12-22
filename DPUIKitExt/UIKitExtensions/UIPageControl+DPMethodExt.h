//
//  UIPageControl+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp 

#import <UIKit/UIKit.h>

@interface UIPageControl (DPMethodExt)

UIPageControl * DPPageControl();

- (UIPageControl *(^)(CGRect))setFrame;

- (UIPageControl *(^)(NSInteger))setNumberOfPages;

- (UIPageControl *(^)(NSInteger))setCurrentPage;

- (UIPageControl *(^)(UIColor *))setPageIndicatorTintColor;

- (UIPageControl *(^)(UIColor *))setCurrentPageIndicatorTintColor;

@end
