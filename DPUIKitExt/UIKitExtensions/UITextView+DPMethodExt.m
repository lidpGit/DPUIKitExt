//
//  UITextView+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp 

#import "UITextView+DPMethodExt.h"
#import "UILabel+DPMethodExt.h"
#import "UIView+DPMethodExt.h"
#import <objc/runtime.h>

const void *key_textView_placeholder_label = "dp_textView_placeholder_label";

@implementation UITextView (DPMethodExt)

UITextView * DPTextView(){
    UITextView *textView = [[UITextView alloc] init];
    textView.setTextContainerInset(UIEdgeInsetsZero);
    textView.contentOffset = CGPointZero;
    [[NSNotificationCenter defaultCenter] addObserver:textView selector:@selector(dp_textViewTextDidChanged) name:UITextViewTextDidChangeNotification object:nil];
    return textView;
}

- (void)createPlaceholderLabel{
    if (!self.placeholderLabel) {
        UILabel *label = DPLabel();
        label.setBackgroundColor([UIColor clearColor]);
        label.setViewPoint(CGPointMake(5, 0));
        self.addSubview(label);
        objc_setAssociatedObject(self, key_textView_placeholder_label, label, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (UILabel *)placeholderLabel{
    return objc_getAssociatedObject(self, key_textView_placeholder_label);
}

- (UITextView *(^)(CGRect))setFrame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UITextView *(^)(UIColor *))setBackgroundColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (UITextView *(^)(id))setDelegate{
    return ^(id target){
        self.delegate = target;
        return self;
    };
}

- (UITextView *(^)(NSString *))setText{
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}

- (UITextView *(^)(UIColor *))setTextColor{
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}

- (UITextView *(^)(UIFont *))setFont{
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}

- (UITextView *(^)(CGPoint))setPlaceholderLabelPoint{
    return ^(CGPoint point){
        [self createPlaceholderLabel];
        self.placeholderLabel.setViewPoint(point);
        return self;
    };
}

- (UITextView *(^)(NSString *))setPlaceholderText{
    return ^(NSString *text){
        [self createPlaceholderLabel];
        self.placeholderLabel.setText(text);
        return self;
    };
}

- (UITextView *(^)(UIColor *))setPlaceholderTextColor{
    return ^(UIColor *color){
        [self createPlaceholderLabel];
        self.placeholderLabel.setTextColor(color);
        return self;
    };
}

- (UITextView *(^)(UIFont *))setPlaceholderTextFont{
    return ^(UIFont *font){
        [self createPlaceholderLabel];
        self.placeholderLabel.setFont(font);
        return self;
    };
}

- (UITextView *(^)(NSTextAlignment))setTextAlignment{
    return ^(NSTextAlignment alignment){
        self.textAlignment = alignment;
        return self;
    };
}

- (UITextView *(^)(NSAttributedString *))setAttributedText{
    return ^(NSAttributedString *attr){
        self.attributedText = attr;
        return self;
    };
}

- (UITextView *(^)(UIEdgeInsets))setTextContainerInset{
    return ^(UIEdgeInsets insets){
        self.textContainerInset = insets;
        return self;
    };
}

- (UITextView *(^)(BOOL))setEditable{
    return ^(BOOL editable){
        self.editable = editable;
        return self;
    };
}

- (UITextView *(^)(BOOL))setSelectable{
    return ^(BOOL selectable){
        self.selectable = selectable;
        return self;
    };
}

- (UITextView *(^)(UIView *))setInputView{
    return ^(UIView *view){
        self.inputView = view;
        return self;
    };
}

- (UITextView *(^)(UIView *))setInputAccessoryView{
    return ^(UIView *view){
        self.inputAccessoryView = view;
        return self;
    };
}

- (UITextView *(^)(UIReturnKeyType))setReturnKeyType{
    return ^(UIReturnKeyType type){
        self.returnKeyType = type;
        return self;
    };
}

- (void)dp_textViewTextDidChanged{
    self.placeholderLabel.hidden = self.text.length > 0;
}

- (UITextView *(^)(UIKeyboardType))setKeyboardType{
    return ^(UIKeyboardType type){
        self.keyboardType = type;
        return self;
    };
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
