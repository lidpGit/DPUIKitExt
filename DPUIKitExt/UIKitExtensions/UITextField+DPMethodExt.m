//
//  UITextField+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp 

#import "UITextField+DPMethodExt.h"

@implementation UITextField (DPMethodExt)

UITextField * DPTextField(){
    return [[UITextField alloc] init];
}

- (UITextField *(^)(CGRect))setFrame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UITextField *(^)(UIColor *))setBackgroundColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (UITextField *(^)(NSString *))setText{
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}

- (UITextField *(^)(NSString *))setPlaceholder{
    return ^(NSString *placeholder){
        self.placeholder = placeholder;
        return self;
    };
}

- (UITextField *(^)(UIFont *))setFont{
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}

- (UITextField *(^)(UIColor *))setTextColor{
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}

- (UITextField *(^)(NSTextAlignment))setTextAlignment{
    return ^(NSTextAlignment alignment){
        self.textAlignment = alignment;
        return self;
    };
}

- (UITextField *(^)(UITextBorderStyle))setBorderStyle{
    return ^(UITextBorderStyle style){
        self.borderStyle = style;
        return self;
    };
}

- (UITextField *(^)(id))setDelegate{
    return ^(id target){
        self.delegate = target;
        return self;
    };
}

- (UITextField *(^)(UITextFieldViewMode))setClearButtonMode{
    return ^(UITextFieldViewMode mode){
        self.clearButtonMode = mode;
        return self;
    };
}

- (UITextField *(^)(UIView *, UITextFieldViewMode))setLeftView{
    return ^(UIView *view, UITextFieldViewMode mode){
        self.leftView = view;
        self.leftViewMode = mode;
        return self;
    };
}

- (UITextField *(^)(UIView *, UITextFieldViewMode))setRightView{
    return ^(UIView *view, UITextFieldViewMode mode){
        self.rightView = view;
        self.rightViewMode = mode;
        return self;
    };
}

- (UITextField *(^)(UIView *))setInputView{
    return ^(UIView *view){
        self.inputView = view;
        return self;
    };
}

- (UITextField *(^)(UIView *))setInputAccessoryView{
    return ^(UIView *view){
        self.inputAccessoryView = view;
        return self;
    };
}

- (UITextField *(^)(UIReturnKeyType))setReturnKeyType{
    return ^(UIReturnKeyType type){
        self.returnKeyType = type;
        return self;
    };
}

- (UITextField *(^)(UIKeyboardType))setKeyboardType{
    return ^(UIKeyboardType type){
        self.keyboardType = type;
        return self;
    };
}

@end
