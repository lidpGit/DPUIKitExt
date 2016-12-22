//
//  UICollectionView+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp

#import "UICollectionView+DPMethodExt.h"

@implementation UICollectionView (DPMethodExt)

UICollectionView * DPCollectionView(UICollectionViewLayout *layout){
    return [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
}

- (UICollectionView *(^)(CGRect))setFrame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UICollectionView *(^)(UIColor *))setBackgroundColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (UICollectionView *(^)(id))setDelegate{
    return ^(id target){
        self.delegate = target;
        return self;
    };
}

- (UICollectionView *(^)(id))setDataSource{
    return ^(id target){
        self.dataSource = target;
        return self;
    };
}

- (UICollectionView *(^)(__unsafe_unretained Class, NSString *))registerCell{
    return ^(Class cls, NSString *identifier){
        [self registerClass:cls forCellWithReuseIdentifier:identifier];
        return self;
    };
}

- (UICollectionView *(^)(__unsafe_unretained Class, NSString *))registerHeaderSection{
    return ^(Class cls, NSString *identifier){
        [self registerClass:cls forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifier];
        return self;
    };
}

- (UICollectionView *(^)(__unsafe_unretained Class, NSString *))registerFooterSection{
    return ^(Class cls, NSString *identifier){
        [self registerClass:cls forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:identifier];
        return self;
    };
}

- (id (^)(NSString *, NSIndexPath *))cellForDequeueReusable{
    return ^(NSString *identifier, NSIndexPath *indexPath){
        return [self dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    };
}

- (id (^)(NSIndexPath *))cellForIndexPath{
    return ^(NSIndexPath *indexPath){
        return [self cellForItemAtIndexPath:indexPath];
    };
}

- (id (^)(NSString *, NSIndexPath *))headerSectionForDequeueReusable{
    return ^(NSString *identifier, NSIndexPath *indexPath){
        return [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifier forIndexPath:indexPath];
    };
}

- (id (^)(NSIndexPath *))headerSectionForIndexPath{
    return ^(NSIndexPath *indexPath){
        return [self supplementaryViewForElementKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
    };
}

- (id (^)(NSString *, NSIndexPath *))footerSsectionForDequeueReusable{
    return ^(NSString *identifier, NSIndexPath *indexPath){
        return [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:identifier forIndexPath:indexPath];
    };
}

- (id (^)(NSIndexPath *))footerSectionForIndexPath{
    return ^(NSIndexPath *indexPath){
        return [self supplementaryViewForElementKind:UICollectionElementKindSectionFooter atIndexPath:indexPath];
    };
}

- (UICollectionView *(^)(NSIndexPath *, UICollectionViewScrollPosition, BOOL))scrollToItemAtIndexPath{
    return ^(NSIndexPath *indexPath, UICollectionViewScrollPosition position, BOOL animated){
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:position animated:animated];
        return self;
    };
}

- (UICollectionView *(^)(NSIndexSet *))insertSections{
    return ^(NSIndexSet *set){
        [self insertSections:set];
        return self;
    };
}

- (UICollectionView *(^)(NSIndexSet *))deleteSections{
    return ^(NSIndexSet *set){
        [self deleteSections:set];
        return self;
    };
}

- (UICollectionView *(^)(NSIndexSet *))reloadSections{
    return ^(NSIndexSet *set){
        [self reloadSections:set];
        return self;
    };
}

- (UICollectionView *(^)(NSInteger, NSInteger))moveSection{
    return ^(NSInteger from, NSInteger to){
        [self moveSection:from toSection:to];
        return self;
    };
}

- (UICollectionView *(^)(NSArray<NSIndexPath *> *))insertItems{
    return ^(NSArray *items){
        [self insertItemsAtIndexPaths:items];
        return self;
    };
}

- (UICollectionView *(^)(NSArray<NSIndexPath *> *))deleteItems{
    return ^(NSArray *items){
        [self deleteItemsAtIndexPaths:items];
        return self;
    };
}

- (UICollectionView *(^)(NSArray<NSIndexPath *> *))reloadItems{
    return ^(NSArray *items){
        [self reloadItemsAtIndexPaths:items];
        return self;
    };
}

- (UICollectionView *(^)(NSIndexPath *, NSIndexPath *))moveItem{
    return ^(NSIndexPath *from, NSIndexPath *to){
        [self moveItemAtIndexPath:from toIndexPath:to];
        return self;
    };
}

@end

@implementation UICollectionViewFlowLayout (DPMethodExt)

UICollectionViewFlowLayout * DPCollectionViewFlowLayout(){
    return [[UICollectionViewFlowLayout alloc] init];
}

- (UICollectionViewFlowLayout *(^)(CGFloat))setMinimumLineSpacing{
    return ^(CGFloat spacing){
        self.minimumLineSpacing = spacing;
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(CGFloat))setMinimumInteritemSpacing{
    return ^(CGFloat spacing){
        self.minimumInteritemSpacing = spacing;
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(CGSize))setItemSize{
    return ^(CGSize size){
        self.itemSize = size;
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(UICollectionViewScrollDirection))setScrollDirection{
    return ^(UICollectionViewScrollDirection direction){
        self.scrollDirection = direction;
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(CGSize))setHeaderReferenceSize{
    return ^(CGSize size){
        self.headerReferenceSize = size;
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(CGSize))setFooterReferenceSize{
    return ^(CGSize size){
        self.footerReferenceSize = size;
        return self;
    };
}

- (UICollectionViewFlowLayout *(^)(UIEdgeInsets))setSectionInset{
    return ^(UIEdgeInsets insets){
        self.sectionInset = insets;
        return self;
    };
}

@end
