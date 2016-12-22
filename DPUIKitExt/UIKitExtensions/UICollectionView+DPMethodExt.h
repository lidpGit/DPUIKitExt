//
//  UICollectionView+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp

#import <UIKit/UIKit.h>

@interface UICollectionView (DPMethodExt)

/**
 创建

 @param layout 布局

 @return UICollectionView
 */
UICollectionView * DPCollectionView(UICollectionViewLayout *layout);

/**
 设置frame
 */
- (UICollectionView *(^)(CGRect))setFrame;

/**
 设置背景颜色
 */
- (UICollectionView *(^)(UIColor *))setBackgroundColor;

/**
 设置代理
 */
- (UICollectionView *(^)(id))setDelegate;

/**
 设置数据源
 */
- (UICollectionView *(^)(id))setDataSource;

/**
 注册cell，参数1为class，参数2为重用标识符
 */
- (UICollectionView *(^)(Class, NSString *))registerCell;

/**
 注册分区头，参数1为class，参数2为重用标识符
 */
- (UICollectionView *(^)(Class, NSString *))registerHeaderSection;

/**
 注册分区尾，参数1为class，参数2为重用标识符
 */
- (UICollectionView *(^)(Class, NSString *))registerFooterSection;

/**
 根据重用标识符和indexPath获取cell
 */
- (id (^)(NSString *, NSIndexPath *))cellForDequeueReusable;

/**
 根据indexPath获取cell
 */
- (id (^)(NSIndexPath *))cellForIndexPath;

/**
 根据重用标识符和indexPath获取分区头
 */
- (id (^)(NSString *, NSIndexPath *))headerSectionForDequeueReusable;

/**
 根据indexPath获取分区头
 */
- (id (^)(NSIndexPath *))headerSectionForIndexPath;

/**
 根据重用标识符和indexPath获取分区尾
 */
- (id (^)(NSString *, NSIndexPath *))footerSsectionForDequeueReusable;

/**
 根据indexPath获取分区尾
 */
- (id (^)(NSIndexPath *))footerSectionForIndexPath;

/**
 滚动到指定indexPath，参数1为indexPath，参数2为滚动位置，参数3为是否需要动画
 */
- (UICollectionView *(^)(NSIndexPath *, UICollectionViewScrollPosition, BOOL))scrollToItemAtIndexPath;

/**
 插入分区
 */
- (UICollectionView *(^)(NSIndexSet *))insertSections;

/**
 删除分区
 */
- (UICollectionView *(^)(NSIndexSet *))deleteSections;

/**
 重载分区
 */
- (UICollectionView *(^)(NSIndexSet *))reloadSections;

/**
 移动分区，参数1为移动之前分区下标，参数2为移动后分区下标
 */
- (UICollectionView *(^)(NSInteger, NSInteger))moveSection;

/**
 插入cell
 */
- (UICollectionView *(^)(NSArray<NSIndexPath *> *))insertItems;

/**
 删除cell
 */
- (UICollectionView *(^)(NSArray<NSIndexPath *> *))deleteItems;

/**
 重载cell
 */
- (UICollectionView *(^)(NSArray<NSIndexPath *> *))reloadItems;

/**
 移动cell，参数1为移动前的indexPath，参数2为移动后的indexPath
 */
- (UICollectionView *(^)(NSIndexPath *, NSIndexPath *))moveItem;

@end

@interface UICollectionViewFlowLayout (DPMethodExt)

/**
 创建UICollectionViewFlowLayout

 @return UICollectionViewFlowLayout
 */
UICollectionViewFlowLayout * DPCollectionViewFlowLayout();

/**
 设置每行cell间距
 */
- (UICollectionViewFlowLayout *(^)(CGFloat))setMinimumLineSpacing;

/**
 设置每列cell间距
 */
- (UICollectionViewFlowLayout *(^)(CGFloat))setMinimumInteritemSpacing;

/**
 设置每个cell宽高
 */
- (UICollectionViewFlowLayout *(^)(CGSize))setItemSize;

/**
 设置滚动方向
 */
- (UICollectionViewFlowLayout *(^)(UICollectionViewScrollDirection))setScrollDirection;

/**
 设置分区头宽高
 */
- (UICollectionViewFlowLayout *(^)(CGSize))setHeaderReferenceSize;

/**
 设置分区尾宽高
 */
- (UICollectionViewFlowLayout *(^)(CGSize))setFooterReferenceSize;

/**
 设置分区外边距
 */
- (UICollectionViewFlowLayout *(^)(UIEdgeInsets))setSectionInset;

@end
