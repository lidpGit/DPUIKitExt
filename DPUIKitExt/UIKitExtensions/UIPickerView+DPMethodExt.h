//
//  UIPickerView+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp

#import <UIKit/UIKit.h>

@interface UIPickerView (DPMethodExt)

UIPickerView * DPPickerView();

- (UIPickerView *(^)(CGRect))setFrame;

- (UIPickerView *(^)(id))setDataSource;

- (UIPickerView *(^)(id))setDelegate;

- (UIPickerView *(^)(BOOL))showsSelectionIndicator;

- (UIView *(^)(NSInteger, NSInteger))viewForRowAndComponent;

- (void (^)(NSInteger, NSInteger, BOOL))setSelectRow;

- (NSInteger (^)(NSInteger))selectedRowInComponent;

@end
