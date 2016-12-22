//
//  UITableView+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp 

#import <UIKit/UIKit.h>

#pragma mark - UITableView category
@interface UITableView (DPMethodExt)

/**
 创建UITableView

 @param style 样式

 @return UITableView
 */
UITableView * DPTableViewForStyle(UITableViewStyle style);

/**
 设置frame
 */
- (UITableView *(^)(CGRect))setFrame;

/**
 设置背景颜色
 */
- (UITableView *(^)(UIColor *))setBackgroundColor;

/**
 设置代理
 */
- (UITableView *(^)(id))setDelegate;

/**
 设置数据源
 */
- (UITableView *(^)(id))setDataSource;

/**
 设置分割线上下左右边距
 */
- (UITableView *(^)(UIEdgeInsets))setSeparatorInset;

/**
 设置分割线样式
 */
- (UITableView *(^)(UITableViewCellSeparatorStyle))setSeparatorStyle;

/**
 设置分割线颜色
 */
- (UITableView *(^)(UIColor *))setSeparatorColor;

/**
 设置头部视图
 */
- (UITableView *(^)(UIView *))setTableHeaderView;

/**
 设置底部视图
 */
- (UITableView *(^)(UIView *))setTableFooterView;

/**
 注册cell
 */
- (UITableView *(^)(Class, NSString *))registerCell;

/**
 注册HeaderFooterView
 */
- (UITableView *(^)(Class, NSString *))registerHeaderFooterView;

/**
 增加分区
 */
- (UITableView *(^)(NSIndexSet *, UITableViewRowAnimation))insertSections;

/**
 删除分区
 */
- (UITableView *(^)(NSIndexSet *, UITableViewRowAnimation))deleteSections;

/**
 刷新分区
 */
- (UITableView *(^)(NSIndexSet *, UITableViewRowAnimation))reloadSections;

/**
 移动分区
 参数1为原分区下标
 参数2为要移动到的分区下标
 */
- (UITableView *(^)(NSInteger, NSInteger))moveSection;

/**
 增加cell
 */
- (UITableView *(^)(NSArray *, UITableViewRowAnimation))insertRows;

/**
 删除cell
 */
- (UITableView *(^)(NSArray *, UITableViewRowAnimation))deleteRows;

/**
 刷新cell
 */
- (UITableView *(^)(NSArray *, UITableViewRowAnimation))reloadRows;

/**
 移动行
 参数1为原indexPath
 参数2为要移动到的indexPath
 */
- (UITableView *(^)(NSIndexPath *, NSIndexPath *))moveRow;

/**
 根据重用标识符获取cell
 */
- (id (^)(NSString *))cellForDequeueReusable;

/**
 根据IndexPath获取cell
 */
- (UITableViewCell *(^)(NSIndexPath *))cellForIndexPath;

/**
 根据重用标识符获取分区头/尾
 */
- (id (^)(NSString *))headerFooterViewForDequeueReusable;

/**
 根据分区下标获取分区头
 */
- (UITableViewHeaderFooterView *(^)(NSInteger))headerViewForSection;

/**
 根据分区下标获取分区尾
 */
- (UITableViewHeaderFooterView *(^)(NSInteger))footerViewForSection;

/**
 获取cell高度
 
 @param identifier    重用标识符
 @param configuration 配置cell，设置cell数据源
 
 @return 返回cell高度
 */
- (CGFloat)dp_heightForCellWithIdentifier:(NSString *)identifier configuration:(void (^)(id tempCell))configuration;

/**
 获取Header/Footer高度
 
 @param identifier    重用标识符
 @param configuration 回调，用于设置数据源
 
 @return 高度
 */
- (CGFloat)dp_heightForHeaderFooterViewReuseIdentifier:(NSString *)identifier configuration:(void (^)(id tempHeaderFooterView))configuration;

@end

#pragma mark - UITableViewCell category
@interface UITableViewCell (DPMethodExt)

/**
 contentView宽度
 */
@property (assign, nonatomic) CGFloat dp_contentViewWidth;

/**
 是否使用自动布局，默认NO
 */
@property (assign, nonatomic) BOOL dp_useAutoLayout;

/**
 获取cell高度，默认45
 
 @return 计算后的高度
 */
- (CGFloat)dp_getCellHeight;

@end

#pragma mark - UITableViewHeaderFooterView category
@interface UITableViewHeaderFooterView (DPMethodExt)

/**
 contentView宽度
 */
@property (assign, nonatomic) CGFloat dp_contentViewWidth;

/**
 是否使用自动布局，默认NO
 */
@property (assign, nonatomic) BOOL dp_useAutoLayout;

/**
 获取高度，默认20
 
 @return 计算后的高度
 */
- (CGFloat)dp_getHeaderFooterViewHeight;

@end
