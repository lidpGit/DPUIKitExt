//
//  UIDatePicker+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp

#import <UIKit/UIKit.h>

@interface UIDatePicker (DPMethodExt)

UIDatePicker * DPDatePicker();

- (UIDatePicker *(^)(CGRect))setFrame;

- (UIDatePicker *(^)(UIDatePickerMode))setDatePickerMode;

- (UIDatePicker *(^)(NSDate *, BOOL))setDate;

- (UIDatePicker *(^)(NSDate *))setMinimumDate;

- (UIDatePicker *(^)(NSDate *))setMaximumDate;

@end
