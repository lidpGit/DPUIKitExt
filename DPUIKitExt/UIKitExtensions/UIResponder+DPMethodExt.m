//
//  UIResponder+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp

#import "UIResponder+DPMethodExt.h"

@implementation UIResponder (DPMethodExt)

- (void)eventForName:(NSString *)eventName userInfo:(id)userInfo{
    [[self nextResponder] eventForName:eventName userInfo:userInfo];
}

- (void (^)())dp_becomeFirstResponder{
    return ^(){
        [self becomeFirstResponder];
    };
}

- (void (^)())dp_resignFirstResponder{
    return ^(){
        [self resignFirstResponder];
    };
}

@end
