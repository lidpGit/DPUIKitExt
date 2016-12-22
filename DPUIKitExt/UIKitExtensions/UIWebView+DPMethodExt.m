//
//  UIWebView+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp

#import "UIWebView+DPMethodExt.h"

@implementation UIWebView (DPMethodExt)

UIWebView * DPWebView(){
    return [[UIWebView alloc] init];
}

- (UIWebView *(^)(CGRect))setFrame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIWebView *(^)(id))setDelegate{
    return ^(id target){
        self.delegate = target;
        return self;
    };
}

/**
 加载html，传入链接地址字符串
 */
- (UIWebView *(^)(NSString *))loadRequest{
    return ^(NSString *URL){
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URL]];
        [self loadRequest:request];
        return self;
    };
}

/**
 加载html，参数1为html字符串，参数2为链接地址字符串
 */
- (UIWebView *(^)(NSString *, NSString *))loadHTMLString{
    return ^(NSString *htmlStr, NSString *URL){
        NSURL *baseURL = nil;
        if (URL.length > 0) {
            baseURL = [NSURL URLWithString:URL];
        }
        [self loadHTMLString:htmlStr baseURL:baseURL];
        return self;
    };
}

@end
