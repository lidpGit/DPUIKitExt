//
//  UIProgressView+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp 

#import <UIKit/UIKit.h>

@interface UIProgressView (DPMethodExt)

UIProgressView * DPProgressViewWithFrame(CGRect frame);

UIProgressView * DPProgressViewWithStyle(UIProgressViewStyle style);

- (UIProgressView *(^)(CGRect))setFrame;

- (UIProgressView *(^)(UIProgressViewStyle))setProgressViewStyle;

- (UIProgressView *(^)(float, BOOL))setProgress;

- (UIProgressView *(^)(UIColor *))setProgressTintColor;

- (UIProgressView *(^)(UIColor *))setTrackTintColor;

- (UIProgressView *(^)(UIImage *))setProgressImage;

- (UIProgressView *(^)(UIImage *))setTrackImage;

@end
