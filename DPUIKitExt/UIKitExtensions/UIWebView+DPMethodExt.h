//
//  UIWebView+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp

#import <UIKit/UIKit.h>

@interface UIWebView (DPMethodExt)

UIWebView * DPWebView();

- (UIWebView *(^)(CGRect))setFrame;

- (UIWebView *(^)(id))setDelegate;

/**
 加载html，传入链接地址字符串
 */
- (UIWebView *(^)(NSString *))loadRequest;

/**
 加载html，参数1为html字符串，参数2为链接地址字符串
 */
- (UIWebView *(^)(NSString *, NSString *))loadHTMLString;

@end
