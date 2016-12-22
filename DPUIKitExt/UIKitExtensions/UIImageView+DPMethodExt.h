//
//  UIImageView+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp

#import <UIKit/UIKit.h>

@interface UIImageView (DPMethodExt)

/**
 创建UIImageView

 @return UIImageView
 */
UIImageView * DPImageView();

/**
 设置frame
 */
- (UIImageView *(^)(CGRect))setFrame;

/**
 设置图片
 */
- (UIImageView *(^)(UIImage *))setImage;

/**
 设置高亮图片
 */
- (UIImageView *(^)(UIImage *))setHighlightedImage;

/**
 设置轮播图片数组
 */
- (UIImageView *(^)(NSArray *))setAnimationImages;

/**
 设置高亮轮播图片数组
 */
- (UIImageView *(^)(NSArray *))setHighlightedAnimationImages;

/**
 设置动画持续时间
 */
- (UIImageView *(^)(NSTimeInterval))setAnimationDuration;

/**
 设置动画重复次数
 */
- (UIImageView *(^)(NSInteger))setAnimationRepeatCount;

/**
 是否高亮
 */
- (UIImageView *(^)(BOOL))setHighlighted;

/**
 设置背景颜色
 */
- (UIImageView *(^)(UIColor *))setBackgroundColor;

/**
 设置tag
 */
- (UIImageView *(^)(NSInteger))setTag;

/**
 添加点击手势
 */
- (UIImageView *(^)(id, SEL))addTapGesture;

- (UIImageView *(^)(UIViewContentMode))setContentMode;

@end
