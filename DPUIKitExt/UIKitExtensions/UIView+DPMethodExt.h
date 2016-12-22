//
//  UIView+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp 

#import <UIKit/UIKit.h>

@interface UIView (DPMethodExt)

@property (assign, nonatomic, readonly) CGFloat viewWidth;
@property (assign, nonatomic, readonly) CGFloat viewHeight;
@property (assign, nonatomic, readonly) CGSize viewSize;
@property (assign, nonatomic, readonly) CGFloat viewX;
@property (assign, nonatomic, readonly) CGFloat viewY;
@property (assign, nonatomic, readonly) CGPoint viewPoint;
@property (assign, nonatomic, readonly) CGFloat centerX;
@property (assign, nonatomic, readonly) CGFloat centerY;
@property (assign, nonatomic, readonly) CGFloat viewMaxX;
@property (assign, nonatomic, readonly) CGFloat viewMaxY;

/**
 创建UIView

 @return UIView
 */
UIView * DPView();

/**
 设置宽度
 */
- (UIView *(^)(CGFloat))setViewWidth;

/**
 设置高度
 */
- (UIView *(^)(CGFloat))setViewHeight;

/**
 设置宽和高
 */
- (UIView *(^)(CGSize))setViewSize;

/**
 设置x
 */
- (UIView *(^)(CGFloat))setViewX;

/**
 设置y
 */
- (UIView *(^)(CGFloat))setViewY;

/**
 设置x和y
 */
- (UIView *(^)(CGPoint))setViewPoint;

/**
 设置frame
 */
- (UIView *(^)(CGRect))setFrame;

/**
 设置中心点x
 */
- (UIView *(^)(CGFloat))setCenterX;

/**
 设置中心点y
 */
- (UIView *(^)(CGFloat))setCenterY;

/**
 设置中心点x和y
 */
- (UIView *(^)(CGPoint))setCenter;

/**
 设置背景颜色
 */
- (UIView *(^)(UIColor *))setBackgroundColor;

/**
 添加子视图
 */
- (UIView *(^)(UIView *))addSubview;

/**
 添加子视图(添加到某个子视图下面)
 参数1为要添加的子视图
 参数2为上层视图
 */
- (UIView *(^)(UIView *, UIView *))insertBelowSubview;

/**
 添加子视图(添加到某个子视图上面)
 参数1为要添加的子视图
 参数2为下层视图
 */
- (UIView *(^)(UIView *, UIView *))insertAboveSubview;

/**
 设置tag值
 */
- (UIView *(^)(NSInteger))setTag;

/**
 设置透明度
 */
- (UIView *(^)(CGFloat))setAlpha;

/**
 设置是否允许交互
 */
- (UIView *(^)(BOOL))setUserInteractionEnabled;

/**
 设置变换样式
 */
- (UIView *(^)(CGAffineTransform))setTransform;

/**
 设置子视图是否根据父视图改变而改变
 */
- (UIView *(^)(BOOL))setAutoresizesSubviews;

/**
 设置需要根据父视图改变而改变的属性
 */
- (UIView *(^)(UIViewAutoresizing))setAutoresizingMask;

/**
 设置圆角
 */
- (UIView *(^)(CGFloat))setCornerRadius;

/**
 设置边框
 参数1为边框宽度
 参数2为边框颜色
 */
- (UIView *(^)(CGFloat, UIColor *))setBorderStyle;

/**
 设置阴影
 参数1为阴影颜色
 参数2为阴影透明度
 参数3为阴影偏移量
 */
- (UIView *(^)(UIColor *, CGFloat, CGSize))setShadowStyle;

/**
 结束编辑
 */
- (void (^)(BOOL))endEditing;

@end
