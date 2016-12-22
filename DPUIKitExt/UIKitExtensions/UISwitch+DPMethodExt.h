//
//  UISwitch+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp 

#import <UIKit/UIKit.h>

@interface UISwitch (DPMethodExt)

UISwitch * DPSwitch(CGRect frame);

- (UISwitch *(^)(CGRect))setFrame;

- (UISwitch *(^)(UIColor *))setOnTintColor;

- (UISwitch *(^)(UIColor *))setTintColor;

- (UISwitch *(^)(UIColor *))setThumbTintColor;

- (UISwitch *(^)(UIImage *))setOnImage;

- (UISwitch *(^)(UIImage *))setOffImage;

- (UISwitch *(^)(BOOL, BOOL))setOn;

@end
