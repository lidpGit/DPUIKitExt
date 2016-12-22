//
//  UILabel+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp 

#import "UILabel+DPMethodExt.h"
#import "UIView+DPMethodExt.h"
#import <objc/runtime.h>

const void *key_lineSpacing = @"dp_lineSpacing"; /**< 行间距值 */
const void *key_firstLineHeadIndent = @"dp_firstLineHeadIndent"; /**< 首行缩进值 */

@implementation UILabel (DPMethodExt)

UILabel * DPLabel(){
    UILabel *label = [[UILabel alloc] init];
    label.setBackgroundColor([UIColor whiteColor]);
    return label;
}

- (UILabel *(^)(CGRect))setFrame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UILabel *(^)(CGFloat))setMaxWidth{
    return ^(CGFloat maxWidth){
        self.setViewWidth(maxWidth);
        [self sizeToFit];
        return self;
    };
}

- (UILabel *(^)(NSString *))setText{
    return ^(NSString *text){
        self.text = text ? [NSString stringWithFormat:@"%@", text] : nil;
        [self sizeToFit];
        return self;
    };
}

- (UILabel *(^)(UIFont *))setFont{
    return ^(UIFont *font){
        self.font = font;
        [self sizeToFit];
        return self;
    };
}

- (UILabel *(^)(UIColor *))setTextColor{
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment))setTextAlignment{
    return ^(NSTextAlignment alignment){
        self.textAlignment = alignment;
        return self;
    };
}

- (UILabel *(^)(NSAttributedString *))setAttributeString{
    return ^(NSAttributedString *attr){
        self.attributedText = attr;
        return self;
    };
}

- (UILabel *(^)(UIColor *))setBackgroundColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (UILabel *(^)(NSInteger))setLine{
    return ^(NSInteger line){
        self.numberOfLines = line;
        [self sizeToFit];
        return self;
    };
}

- (UILabel *(^)(NSInteger))setTag{
    return ^(NSInteger tag){
        self.tag = tag;
        return self;
    };
}

- (UILabel *(^)(BOOL))setUserInteractionEnabled{
    return ^(BOOL enabled){
        self.userInteractionEnabled = enabled;
        return self;
    };
}

- (UILabel *(^)(CGFloat))setLineSpacing{
    return ^(CGFloat lineSpacing){
        if (self.text) {
            objc_setAssociatedObject(self, key_lineSpacing, @(lineSpacing), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
            NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineSpacing = lineSpacing;
            CGFloat headIndent = [objc_getAssociatedObject(self, key_firstLineHeadIndent) floatValue];
            paragraphStyle.firstLineHeadIndent = headIndent;
            [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedString.length)];
            self.attributedText = attributedString;
            [self sizeToFit];
        }
        return self;
    };
}

- (UILabel *(^)(CGFloat))setCharacterSpacing{
    return ^(CGFloat spacing){
        if (self.text) {
            NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
            [attributedString addAttribute:NSKernAttributeName value:@(spacing) range:NSMakeRange(0, attributedString.length)];
            self.attributedText = attributedString;
            [self sizeToFit];
        }
        return self;
    };
}

- (UILabel *(^)(NSRange, UIColor *))setSpanColor{
    return ^(NSRange range, UIColor *color){
        if (self.text) {
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
            [attributedString addAttributes:@{NSForegroundColorAttributeName:color} range:range];
            self.attributedText = attributedString;
            [self sizeToFit];
        }
        return self;
    };
}

- (UILabel *(^)(CGFloat))setFirstLineHeadIndent{
    return ^(CGFloat headIndent){
        if (self.text) {
            objc_setAssociatedObject(self, key_firstLineHeadIndent, @(headIndent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
            NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.firstLineHeadIndent = headIndent;
            CGFloat lineSpacing = [objc_getAssociatedObject(self, key_lineSpacing) floatValue];
            paragraphStyle.lineSpacing = lineSpacing;
            [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedString.length)];
            self.attributedText = attributedString;
            [self sizeToFit];
        }
        return self;
    };
}

- (UILabel *(^)(UIColor *, CGSize))setShadow{
    return ^(UIColor *shadowColor, CGSize shadowOffset){
        self.shadowColor = shadowColor;
        self.shadowOffset = shadowOffset;
        return self;
    };
}

@end
