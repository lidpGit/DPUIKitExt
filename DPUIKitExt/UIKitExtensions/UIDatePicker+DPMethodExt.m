//
//  UIDatePicker+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp

#import "UIDatePicker+DPMethodExt.h"

@implementation UIDatePicker (DPMethodExt)

UIDatePicker * DPDatePicker(){
    return [[UIDatePicker alloc] init];
}

- (UIDatePicker *(^)(CGRect))setFrame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIDatePicker *(^)(UIDatePickerMode))setDatePickerMode{
    return ^(UIDatePickerMode model){
        self.datePickerMode = model;
        return self;
    };
}

- (UIDatePicker *(^)(NSDate *, BOOL))setDate{
    return ^(NSDate *date, BOOL animated){
        [self setDate:date animated:animated];
        return self;
    };
}

- (UIDatePicker *(^)(NSDate *))setMinimumDate{
    return ^(NSDate *date){
        self.minimumDate = date;
        return self;
    };
}

- (UIDatePicker *(^)(NSDate *))setMaximumDate{
    return ^(NSDate *date){
        self.maximumDate = date;
        return self;
    };
}

@end
