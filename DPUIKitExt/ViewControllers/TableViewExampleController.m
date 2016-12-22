//
//  TableViewExampleController.m
//  UIKitExtensions
//
//  Created by lidp 

#import "TableViewExampleController.h"
#import "DPUIKitMethodExt.h"

#pragma mark - UITableViewCell
@implementation TestCell{
    UILabel     *_titleLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _titleLabel = DPLabel().setFont([UIFont systemFontOfSize:15]).
                        setTextColor([UIColor blackColor]).
                        setLine(0).
                        setBackgroundColor([UIColor yellowColor]);
        self.contentView.addSubview(_titleLabel);
    }
    return self;
}

- (void)setTitle:(NSString *)title{
    _title = [title copy];
    _titleLabel.setText(_title);
    [self resetFrame];
}

- (void)resetFrame{
    _titleLabel.setViewX(15).setViewY(15);
    _titleLabel.setMaxWidth(self.dp_contentViewWidth - _titleLabel.viewX * 2);
}

//使用frame自动计算高度，需要重写此方法，返回cell高度
- (CGFloat)dp_getCellHeight{
    return _titleLabel.viewMaxY + 15;
}

@end

#pragma mark - HeaderSection
@implementation TestHeaderView{
    UILabel     *_titleLabel;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        _titleLabel = DPLabel().setFont([UIFont systemFontOfSize:15]).
                        setTextColor([UIColor blackColor]).
                        setLine(0).
                        setBackgroundColor([UIColor orangeColor]);
        self.contentView.addSubview(_titleLabel);
    }
    return self;
}

- (void)setTitle:(NSString *)title{
    _title = [title copy];
    _titleLabel.setText(_title);
}

@end

#pragma mark - FooterSection
@implementation TestFooterView{
    UILabel     *_titleLabel;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        _titleLabel = DPLabel().setFont([UIFont systemFontOfSize:15]).
                        setTextColor([UIColor blackColor]).
                        setLine(0).
                        setBackgroundColor([UIColor cyanColor]);
        self.contentView.addSubview(_titleLabel);
    }
    return self;
}

- (void)setTitle:(NSString *)title{
    _title = [title copy];
    _titleLabel.setText(_title);
}

@end

#pragma mark - ViewController
@interface TableViewExampleController ()

@end

static NSString *const cell_id = @"UITableViewCell";
static NSString *const header_id = @"HeaderSection";
static NSString *const footer_id = @"FooterSection";
@implementation TableViewExampleController{
    NSArray     *_cellDataList;
    NSArray     *_headerDataList;
    NSArray     *_footerDataList;
}

- (void)dealloc{
    NSLog(@"%s", __FUNCTION__);
}

- (instancetype)init{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.setTitle(@"Cell自动计算行高(frame和AutoLayout)");
    _cellDataList = @[@"cell title,cell title,cell title,cell title,cell title,cell title,cell title,cell title,cell title,cell title,cell title,cell title,cell title,cell title,cell title,cell title,cell title,cell title", @"cell title", @"cell title,cell title,cell title,cell title,cell title,cell title,cell title"];
    _headerDataList = @[@"header title,header title,header title,header title,header title"];
    _footerDataList = @[@"footer title,footer title,footer title,footer title,footer title,footer title,footer title"];
    
    self.tableView.registerCell(TestCell.class, cell_id).
        registerHeaderFooterView(TestHeaderView.class, header_id).
        registerHeaderFooterView(TestFooterView.class, footer_id).
        setSeparatorColor([UIColor redColor]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - ---------------------- UITableViewDelegate/UITableDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TestCell *cell = tableView.cellForDequeueReusable(cell_id);
    cell.title = _cellDataList[indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    TestHeaderView *headerView = tableView.headerFooterViewForDequeueReusable(header_id);
    headerView.title = _headerDataList[section];
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    TestFooterView *footerView = tableView.headerFooterViewForDequeueReusable(footer_id);
    footerView.title = _footerDataList[section];
    return footerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView dp_heightForCellWithIdentifier:cell_id configuration:^(id tempCell) {
        TestCell *cell = tempCell;
//        cell.dp_useAutoLayout = YES;
        cell.title = _cellDataList[indexPath.row];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return [tableView dp_heightForHeaderFooterViewReuseIdentifier:header_id configuration:^(id tempHeaderFooterView) {
        TestHeaderView *headerView = tempHeaderFooterView;
        headerView.dp_useAutoLayout = YES;
        headerView.title = _headerDataList[section];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return [tableView dp_heightForHeaderFooterViewReuseIdentifier:footer_id configuration:^(id tempHeaderFooterView) {
        TestFooterView *footerView = tempHeaderFooterView;
//        footerView.dp_useAutoLayout = YES;
        footerView.title = _footerDataList[section];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _cellDataList.count;
}

@end
