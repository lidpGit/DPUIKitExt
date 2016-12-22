//
//  UIScrollView+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp

#import <UIKit/UIKit.h>

@interface UIScrollView (DPMethodExt)

/**
 创建UIScrollView

 @return UIScrollView
 */
UIScrollView * DPScrollView();

/**
 设置frame
 */
- (UIScrollView *(^)(CGRect))setFrame;

/**
 设置背景颜色
 */
- (UIScrollView *(^)(UIColor *))setBackgroundColor;

/**
 设置内容偏移量，参数1为坐标点，参数2为是否需要动画
 */
- (UIScrollView *(^)(CGPoint, BOOL))setContentOffset;

/**
 设置显示内容宽高
 */
- (UIScrollView *(^)(CGSize))setContentSize;

/**
 设置内容边距
 */
- (UIScrollView *(^)(UIEdgeInsets))setContentInset;

/**
 设置代理
 */
- (UIScrollView *(^)(id))setDelegate;

/**
 是否能回弹
 */
- (UIScrollView *(^)(BOOL))setBounces;

/**
 是否始终支持垂直回弹
 */
- (UIScrollView *(^)(BOOL))setAlwaysBounceVertical;

/**
 是否始终支持水平回弹
 */
- (UIScrollView *(^)(BOOL))setAlwaysBounceHorizontal;

/**
 是否分页
 */
- (UIScrollView *(^)(BOOL))setPagingEnabled;

/**
 是否能滚动
 */
- (UIScrollView *(^)(BOOL))setScrollEnabled;

/**
 是否显示水平滚动条
 */
- (UIScrollView *(^)(BOOL))showsHorizontalScrollIndicator;

/**
 是否显示垂直滚动条
 */
- (UIScrollView *(^)(BOOL))showsVerticalScrollIndicator;

/**
 滚动到指定frame，参数1为frame，参数2为是否需要动画
 */
- (UIScrollView *(^)(CGRect, BOOL))scrollRectToVisible;

/**
 设置最大缩放比例
 */
- (UIScrollView *(^)(CGFloat))setMinimumZoomScale;

/**
 设置最小缩放比例
 */
- (UIScrollView *(^)(CGFloat))setMaximumZoomScale;

/**
 设置当前缩放比例，参数1为缩放比例，参数2为是否需要动画
 */
- (UIScrollView *(^)(CGFloat, BOOL))setZoomScale;

/**
 缩放指定frame，参数1为frame，参数2为是否需要动画
 */
- (UIScrollView *(^)(CGRect, BOOL))zoomToRect;

@end
