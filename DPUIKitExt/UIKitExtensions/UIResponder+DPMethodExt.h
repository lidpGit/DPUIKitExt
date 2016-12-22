//
//  UIResponder+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp

#import <UIKit/UIKit.h>

@interface UIResponder (DPMethodExt)

/**
 响应自定义事件

 @param eventName 事件名称
 @param userInfo  附加参数
 */
- (void)eventForName:(NSString *)eventName userInfo:(id)userInfo;

- (void (^)())dp_becomeFirstResponder;

- (void (^)())dp_resignFirstResponder;

@end
