//
//  UIPickerView+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp

#import "UIPickerView+DPMethodExt.h"

@implementation UIPickerView (DPMethodExt)

UIPickerView * DPPickerView(){
    return [[UIPickerView alloc] init];
}

- (UIPickerView *(^)(CGRect))setFrame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIPickerView *(^)(id))setDataSource{
    return ^(id target){
        self.dataSource = target;
        return self;
    };
}

- (UIPickerView *(^)(id))setDelegate{
    return ^(id target){
        self.delegate = target;
        return self;
    };
}

- (UIPickerView *(^)(BOOL))showsSelectionIndicator{
    return ^(BOOL isShow){
        self.showsSelectionIndicator = isShow;
        return self;
    };
}

- (UIView *(^)(NSInteger, NSInteger))viewForRowAndComponent{
    return ^(NSInteger row, NSInteger component){
        return [self viewForRow:row forComponent:component];
    };
}

- (void (^)(NSInteger, NSInteger, BOOL))setSelectRow{
    return ^(NSInteger row, NSInteger component, BOOL animated){
        [self selectRow:row inComponent:component animated:animated];
    };
}

- (NSInteger (^)(NSInteger))selectedRowInComponent{
    return ^(NSInteger component){
        return [self selectedRowInComponent:component];
    };
}

@end
