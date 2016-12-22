//
//  UIButton+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp 

#import "UIButton+DPMethodExt.h"
#import "UIView+DPMethodExt.h"
#import <objc/runtime.h>

const void *key_image_title_spacing = @"imageTitleSpacing"; /**< 图片与文本间距 */
const void *key_layout_type = @"btnLayoutType"; /**< 按钮布局类型 */
const void *key_color_dictionary = "colorDict"; /**< 存储按钮不同状态颜色 */
const void *key_image_dictionary = "imageDict"; /**< 存储按钮不同状态图片 */

@implementation UIButton (DPMethodExt)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //方法交换
        Method originalMethod = class_getInstanceMethod(self.class, @selector(setHighlighted:));
        Method swizzledMethod = class_getInstanceMethod(self.class, @selector(dp_setHighlighted:));
        method_exchangeImplementations(originalMethod, swizzledMethod);
        
        originalMethod = class_getInstanceMethod(self.class, @selector(setSelected:));
        swizzledMethod = class_getInstanceMethod(self.class, @selector(dp_setSelected:));
        method_exchangeImplementations(originalMethod, swizzledMethod);
        
        originalMethod = class_getInstanceMethod(self.class, @selector(layoutSubviews));
        swizzledMethod = class_getInstanceMethod(self.class, @selector(dp_layoutSubviews));
        method_exchangeImplementations(originalMethod, swizzledMethod);
        
        originalMethod = class_getInstanceMethod(self.class, @selector(setTitle:forState:));
        swizzledMethod = class_getInstanceMethod(self.class, @selector(dp_setTitle:forState:));
        method_exchangeImplementations(originalMethod, swizzledMethod);
        
        originalMethod = class_getInstanceMethod(self.class, @selector(setImage:forState:));
        swizzledMethod = class_getInstanceMethod(self.class, @selector(dp_setImage:forState:));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

- (CGFloat)imageTitleSpacing{
    return [objc_getAssociatedObject(self, key_image_title_spacing) floatValue];
}

- (DPBtnLayoutType)layoutType{
    return [objc_getAssociatedObject(self, key_layout_type) integerValue];
}

- (NSMutableDictionary *)imageDict{
    NSMutableDictionary *dict = objc_getAssociatedObject(self, key_image_dictionary);
    if (!dict) {
        dict = [NSMutableDictionary new];
        objc_setAssociatedObject(self, key_image_dictionary, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dict;
}

- (NSMutableDictionary *)colorDict{
    NSMutableDictionary *dict = objc_getAssociatedObject(self, key_color_dictionary);
    if (!dict) {
        dict = [NSMutableDictionary new];
        objc_setAssociatedObject(self, key_color_dictionary, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dict;
}

- (NSString *)dictionaryKeyForState:(UIControlState)state{
    return [NSString stringWithFormat:@"state_%zi", state];
}

UIButton * DPButton(){
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom].setBackgroundColor([UIColor whiteColor], UIControlStateNormal);
    btn.exclusiveTouch = YES;
    return btn;
}

UIButton * DPLayoutButton(CGFloat imageTitleSpacing, DPBtnLayoutType type){
    UIButton *btn = DPButton();
    
    objc_setAssociatedObject(btn, key_image_title_spacing, @(imageTitleSpacing), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(btn, key_layout_type, @(type), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return btn;
}

- (UIButton *(^)(CGRect))setFrame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIButton *(^)(id, SEL))addClickAction{
    return ^(id target, SEL action){
        [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}

- (UIButton *(^)(id, SEL, UIControlEvents))addAction{
    return ^(id target, SEL action, UIControlEvents event){
        [self addTarget:target action:action forControlEvents:event];
        return self;
    };
}

- (UIButton *(^)(UIImage *))setNormalImage{
    return ^(UIImage *image){
        [self setImage:image forState:UIControlStateNormal];
        if (image) [[self imageDict] setValue:image forKey:[self dictionaryKeyForState:UIControlStateNormal]];
        [self setNeedsLayout];
        return self;
    };
}

- (UIButton *(^)(UIImage *))setHighlightImage{
    return ^(UIImage *image){
        [self setImage:image forState:UIControlStateHighlighted];
        if (image) [[self imageDict] setValue:image forKey:[self dictionaryKeyForState:UIControlStateHighlighted]];
        [self setNeedsLayout];
        return self;
    };
}

- (UIButton *(^)(UIImage *))setSelectedImage{
    return ^(UIImage *image){
        [self setImage:image forState:UIControlStateSelected];
        if (image) [[self imageDict] setValue:image forKey:[self dictionaryKeyForState:UIControlStateSelected]];
        [self setNeedsLayout];
        return self;
    };
}

- (UIImage *(^)(UIControlState))getImage{
    return ^(UIControlState state){
        return [self imageForState:state];
    };
}

- (UIButton *(^)(NSString *, UIControlState))setTitle{
    return ^(NSString *title, UIControlState state){
        [self setTitle:title forState:state];
        [self setNeedsLayout];
        return self;
    };
}

- (UIButton *(^)(NSAttributedString *, UIControlState))setAttributedTitle{
    return ^(NSAttributedString *attr, UIControlState state){
        [self setAttributedTitle:attr forState:state];
        return self;
    };
}

- (NSString *(^)(UIControlState))getTitle{
    return ^(UIControlState state){
        return [self titleForState:state];
    };
}

- (UIButton *(^)(UIColor *, UIControlState))setTitleColor{
    return ^(UIColor *color, UIControlState state){
        [self setTitleColor:color forState:state];
        return self;
    };
}

- (UIButton *(^)(UIFont *))setTitleFont{
    return ^(UIFont *font){
        self.titleLabel.font = font;
        return self;
    };
}

- (UIButton *(^)(UIColor *, UIControlState))setBackgroundColor{
    return ^(UIColor *backgroundColor, UIControlState state){
        if (state == UIControlStateNormal) {
            [super setBackgroundColor:backgroundColor];
        }
        if (backgroundColor) [[self colorDict] setValue:backgroundColor forKey:[self dictionaryKeyForState:state]];
        return self;
    };
}

- (UIButton *(^)(NSInteger))setTag{
    return ^(NSInteger tag){
        self.tag = tag;
        return self;
    };
}

//重写父类setBackgroundColor
- (void)setBackgroundColor:(UIColor *)backgroundColor{
    self.setBackgroundColor(backgroundColor, UIControlStateNormal);
}

- (void)dp_setHighlighted:(BOOL)highlighted{
    [self dp_setHighlighted:highlighted];
    
    NSMutableDictionary *colorDict = [self colorDict];
    UIColor *highlightColor = colorDict[[self dictionaryKeyForState:UIControlStateHighlighted]];
    if (highlighted && highlightColor) {
        [super setBackgroundColor:highlightColor];
    }else{
        // 由于系统在调用setSelected后，会再触发一次setHighlighted，故做如下处理，否则，背景色会被最后一次的覆盖掉。
        if ([self isSelected]) {
            UIColor *selectedColor = colorDict[[self dictionaryKeyForState:UIControlStateSelected]];
            [super setBackgroundColor:selectedColor];
        } else {
            UIColor *normalColor = colorDict[[self dictionaryKeyForState:UIControlStateNormal]];
            [super setBackgroundColor:normalColor];
        }
    }
}

- (void)dp_setSelected:(BOOL)selected{
    [self dp_setSelected:selected];
    
    NSMutableDictionary *colorDict = [self colorDict];
    UIColor *selectedColor = colorDict[[self dictionaryKeyForState:UIControlStateSelected]];
    UIColor *normalColor = colorDict[[self dictionaryKeyForState:UIControlStateNormal]];
    if (selected && selectedColor) {
        [super setBackgroundColor:selectedColor ? selectedColor : normalColor];
    } else {
        [super setBackgroundColor:normalColor];
    }
    
    NSMutableDictionary *imageDict = [self imageDict];
    UIImage *selectedImage = imageDict[[self dictionaryKeyForState:UIControlStateSelected]];
    UIImage *normalImage = imageDict[[self dictionaryKeyForState:UIControlStateNormal]];
    if (selected) {
        [self setImage:selectedImage ? selectedImage : normalImage forState:UIControlStateNormal];
    }else{
        [self setImage:normalImage forState:UIControlStateNormal];
    }
}

- (void)dp_setTitle:(NSString *)title forState:(UIControlState)state{
    [self dp_setTitle:title forState:state];
    [self setNeedsLayout];
}

- (void)dp_setImage:(UIImage *)image forState:(UIControlState)state{
    [self dp_setImage:image forState:state];
    [self setNeedsLayout];
}

- (void)dp_layoutSubviews{
    [self dp_layoutSubviews];
//    UIImage *image = self.imageView.image;
//    if (image.size.height > self.viewHeight) {
//        self.imageView.setViewSize(CGSizeMake(image.size.width / (image.size.height / self.viewHeight), self.viewHeight));
//    } else if (image.size.width > self.viewWidth) {
//        self.imageView.setViewSize(CGSizeMake(self.viewWidth, image.size.height / (image.size.width / self.viewWidth)));
//    }
    if (self.layoutType > 0) {
        switch (self.layoutType) {
            case DPBtnLayoutTypeLeftImageRightTitle: //图片在左，标题在右
                self.imageView.setViewX((self.viewWidth - self.imageTitleSpacing - self.titleLabel.viewWidth - self.imageView.viewWidth) / 2);
                self.titleLabel.setViewX(self.imageView.viewMaxX + self.imageTitleSpacing);
                self.imageView.setCenterY(self.viewHeight / 2);
                self.titleLabel.setCenterY(self.imageView.centerY);
                break;
            case DPBtnLayoutTypeLeftTitleRightImage: //标题在左，图片在右
                self.titleLabel.setViewX((self.viewWidth - self.imageTitleSpacing - self.titleLabel.viewWidth - self.imageView.viewWidth) / 2);
                self.imageView.setViewX(self.titleLabel.viewMaxX + self.imageTitleSpacing);
                self.imageView.setCenterY(self.viewHeight / 2);
                self.titleLabel.setCenterY(self.imageView.centerY);
                break;
            case DPBtnLayoutTypeUpImageDownTitle: //图片在上，标题在下
                self.imageView.setViewY((self.viewHeight - self.imageTitleSpacing - self.titleLabel.viewHeight - self.imageView.viewHeight) / 2);
                self.titleLabel.setViewY(self.imageView.viewMaxY + self.imageTitleSpacing);
                self.imageView.setCenterX(self.viewWidth / 2);
                self.titleLabel.setCenterX(self.imageView.centerX);
                break;
            case DPBtnLayoutTypeUpTitleDownImage: //标题在上，图片在下
                self.titleLabel.setViewY((self.viewHeight - self.imageTitleSpacing - self.titleLabel.viewHeight - self.imageView.viewHeight) / 2);
                self.imageView.setViewY(self.titleLabel.viewMaxY + self.imageTitleSpacing);
                self.imageView.setCenterX(self.viewWidth / 2);
                self.titleLabel.setCenterX(self.imageView.centerX);
                break;
            default:
                break;
        }
    }
//    else{
//        if (self.titleLabel.text.length > 0) {
//            self.imageView.setViewX((self.viewWidth - self.titleLabel.viewWidth - self.imageView.viewWidth) / 2);
//            self.titleLabel.setViewX(self.imageView.viewMaxX);
//            self.imageView.setCenterY(self.viewHeight / 2);
//            self.titleLabel.setCenterY(self.imageView.centerY);
//        }else{
//            self.imageView.setCenter(CGPointMake(self.viewWidth / 2, self.viewHeight / 2));
//        }
//    }
}

@end
