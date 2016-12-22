//
//  UITableView+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp 

#import "UITableView+DPMethodExt.h"
#import <objc/runtime.h>

@implementation UITableView (DPMethodExt)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod(self.class, @selector(dequeueReusableCellWithIdentifier:));
        Method swizzledMethod = class_getInstanceMethod(self.class, @selector(dp_dequeueReusableCellWithIdentifier:));
        method_exchangeImplementations(originalMethod, swizzledMethod);
        
        originalMethod = class_getInstanceMethod(self.class, @selector(dequeueReusableHeaderFooterViewWithIdentifier:));
        swizzledMethod = class_getInstanceMethod(self.class, @selector(dp_dequeueReusableHeaderFooterViewWithIdentifier:));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

UITableView * DPTableViewForStyle(UITableViewStyle style){
    return [[UITableView alloc] initWithFrame:CGRectZero style:style];
}

- (UITableView *(^)(CGRect))setFrame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UITableView *(^)(UIColor *))setBackgroundColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (UITableView *(^)(id))setDelegate{
    return ^(id target){
        self.delegate = target;
        return self;
    };
}

- (UITableView *(^)(id))setDataSource{
    return ^(id target){
        self.dataSource = target;
        return self;
    };
}

- (UITableView *(^)(UIEdgeInsets))setSeparatorInset{
    return ^(UIEdgeInsets insets){
        self.separatorInset = insets;
        return self;
    };
}

- (UITableView *(^)(UITableViewCellSeparatorStyle))setSeparatorStyle{
    return ^(UITableViewCellSeparatorStyle style){
        self.separatorStyle = style;
        return self;
    };
}

- (UITableView *(^)(UIColor *))setSeparatorColor{
    return ^(UIColor *color){
        self.separatorColor = color;
        return self;
    };
}

- (UITableView *(^)(UIView *))setTableHeaderView{
    return ^(UIView *view){
        self.tableHeaderView = view;
        return self;
    };
}

- (UITableView *(^)(UIView *))setTableFooterView{
    return ^(UIView *view){
        self.tableFooterView = view;
        return self;
    };
}

- (UITableView *(^)(Class, NSString *))registerCell{
    return ^(Class cls, NSString *identifier){
        [self registerClass:cls forCellReuseIdentifier:identifier];
        return self;
    };
}

- (UITableView *(^)(Class, NSString *))registerHeaderFooterView{
    return ^(Class cls, NSString *identifier){
        [self registerClass:cls forHeaderFooterViewReuseIdentifier:identifier];
        return self;
    };
}

- (UITableView *(^)(NSIndexSet *, UITableViewRowAnimation))insertSections{
    return ^(NSIndexSet *set, UITableViewRowAnimation animation){
        [self insertSections:set withRowAnimation:animation];
        return self;
    };
}

- (UITableView *(^)(NSIndexSet *, UITableViewRowAnimation))deleteSections{
    return ^(NSIndexSet *set, UITableViewRowAnimation animation){
        [self deleteSections:set withRowAnimation:animation];
        return self;
    };
}

- (UITableView *(^)(NSIndexSet *, UITableViewRowAnimation))reloadSections{
    return ^(NSIndexSet *set, UITableViewRowAnimation animation){
        [self reloadSections:set withRowAnimation:animation];
        return self;
    };
}

- (UITableView *(^)(NSInteger, NSInteger))moveSection{
    return ^(NSInteger from, NSInteger to) {
        [self moveSection:from toSection:to];
        return self;
    };
}

- (UITableView *(^)(NSArray *, UITableViewRowAnimation))insertRows{
    return ^(NSArray *indexPaths, UITableViewRowAnimation animation) {
        [self insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
        return self;
    };
}

- (UITableView *(^)(NSArray *, UITableViewRowAnimation))deleteRows{
    return ^(NSArray *indexPaths, UITableViewRowAnimation animation) {
        [self deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
        return self;
    };
}

- (UITableView *(^)(NSArray *, UITableViewRowAnimation))reloadRows{
    return ^(NSArray *indexPaths, UITableViewRowAnimation animation) {
        [self reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
        return self;
    };
}

- (UITableView *(^)(NSIndexPath *, NSIndexPath *))moveRow{
    return ^(NSIndexPath *from, NSIndexPath *to) {
        [self moveRowAtIndexPath:from toIndexPath:to];
        return self;
    };
}

- (id (^)(NSString *))cellForDequeueReusable{
    return ^(NSString *identifier){
        return [self dequeueReusableCellWithIdentifier:identifier];
    };
}

- (UITableViewCell *(^)(NSIndexPath *))cellForIndexPath{
    return ^(NSIndexPath *indexPath){
        return [self cellForRowAtIndexPath:indexPath];
    };
}

- (id (^)(NSString *))headerFooterViewForDequeueReusable{
    return ^(NSString *identifier){
        return [self dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    };
}

- (UITableViewHeaderFooterView *(^)(NSInteger))headerViewForSection{
    return ^(NSInteger section){
        return [self headerViewForSection:section];
    };
}

- (UITableViewHeaderFooterView *(^)(NSInteger))footerViewForSection{
    return ^(NSInteger section){
        return [self footerViewForSection:section];
    };
}

#pragma mark - ---------------------- Cell
- (CGFloat)dp_heightForCellWithIdentifier:(NSString *)identifier configuration:(void (^)(id))configuration{
    if (!identifier) {
        return 0;
    }
    UITableViewCell *cell = [self dp_cellForReuseIdentifier:identifier];
    !configuration ?: configuration(cell);
    CGFloat cellHeight = cell.dp_useAutoLayout ? [self dp_autoLayoutCellHeightForCell:cell] : [cell dp_getCellHeight];
    if (self.separatorStyle != UITableViewCellSeparatorStyleNone) {
        cellHeight += 1.0 / [UIScreen mainScreen].scale;
    }
    return cellHeight;
}

- (UITableViewCell *)dp_cellForReuseIdentifier:(NSString *)identifier{
    NSMutableDictionary *cellList = objc_getAssociatedObject(self, _cmd);
    if (!cellList) {
        cellList = @{}.mutableCopy;
        objc_setAssociatedObject(self, _cmd, cellList, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    UITableViewCell *cell = cellList[identifier];
    if (!cell) {
        cell = [self dequeueReusableCellWithIdentifier:identifier];
        NSAssert(cell != nil, @"请先注册cell");
        cell.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        cellList[identifier] = cell;
    }
    return cell;
}

- (nullable __kindof UITableViewCell *)dp_dequeueReusableCellWithIdentifier:(NSString *)identifier{
    UITableViewCell *cell = [self dp_dequeueReusableCellWithIdentifier:identifier];
    cell.dp_contentViewWidth = CGRectGetWidth(self.frame);
    return cell;
}

- (nullable __kindof UITableViewHeaderFooterView *)dp_dequeueReusableHeaderFooterViewWithIdentifier:(NSString *)identifier{
    UITableViewHeaderFooterView *headerFooterView = [self dp_dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    headerFooterView.dp_contentViewWidth = CGRectGetWidth(self.frame);
    return headerFooterView;
}

- (CGFloat)dp_autoLayoutCellHeightForCell:(UITableViewCell *)cell{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:cell.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.frame.size.width];
    [cell.contentView addConstraint:constraint];
    
    CGFloat cellHeight = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    [cell.contentView removeConstraint:constraint];
    return cellHeight < 0 ? 0 : cellHeight;
}

#pragma mark - ---------------------- HeaderView/FooterView
- (CGFloat)dp_heightForHeaderFooterViewReuseIdentifier:(NSString *)identifier configuration:(void (^)(id))configuration{
    if (!identifier) {
        return 0;
    }
    UITableViewHeaderFooterView *headerFooterView = [self dp_headerFooterViewForReuseIdentifier:identifier];
    !configuration ?: configuration(headerFooterView);
    return headerFooterView.dp_useAutoLayout ? [self dp_autoLayoutheaderFooterViewHeightForCell:headerFooterView] : [headerFooterView dp_getHeaderFooterViewHeight];
}

- (UITableViewHeaderFooterView *)dp_headerFooterViewForReuseIdentifier:(NSString *)identifier{
    NSMutableDictionary *headerFooterViewList = objc_getAssociatedObject(self, _cmd);
    if (!headerFooterViewList) {
        headerFooterViewList = @{}.mutableCopy;
        objc_setAssociatedObject(self, _cmd, headerFooterViewList, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    UITableViewHeaderFooterView *headerFooterView = headerFooterViewList[identifier];
    if (!headerFooterView) {
        headerFooterView = [self dequeueReusableHeaderFooterViewWithIdentifier:identifier];
        NSAssert(headerFooterView != nil, @"必须先注册UITableViewHeaderFooterView");
        headerFooterViewList[identifier] = headerFooterView;
    }
    return headerFooterView;
}

- (CGFloat)dp_autoLayoutheaderFooterViewHeightForCell:(UITableViewHeaderFooterView *)headerFooterView{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:headerFooterView.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.frame.size.width];
    [headerFooterView.contentView addConstraint:constraint];
    
    CGFloat height = [headerFooterView.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    [headerFooterView.contentView removeConstraint:constraint];
    return height < 0 ? 0 : height;
}

@end

#pragma mark - cell category
@implementation UITableViewCell (DPMethodExt)

- (void)setDp_useAutoLayout:(BOOL)dp_useAutoLayout{
    objc_setAssociatedObject(self, @selector(dp_useAutoLayout), @(dp_useAutoLayout), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)dp_useAutoLayout{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setDp_contentViewWidth:(CGFloat)dp_contentViewWidth{
    objc_setAssociatedObject(self, @selector(dp_contentViewWidth), @(dp_contentViewWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)dp_contentViewWidth{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (CGFloat)dp_getCellHeight{
    return 45;
}

@end

#pragma mark - header/footer category
@implementation UITableViewHeaderFooterView (DPMethodExt)

- (void)setDp_contentViewWidth:(CGFloat)dp_contentViewWidth{
    objc_setAssociatedObject(self, @selector(dp_contentViewWidth), @(dp_contentViewWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)dp_contentViewWidth{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setDp_useAutoLayout:(BOOL)dp_useAutoLayout{
    objc_setAssociatedObject(self, @selector(dp_useAutoLayout), @(dp_useAutoLayout), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)dp_useAutoLayout{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (CGFloat)dp_getHeaderFooterViewHeight{
    return 20;
}

@end
