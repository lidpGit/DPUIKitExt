//
//  ViewController.m
//  UIKitExtensions
//
//  Created by lidp

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

static NSString *const cell_id = @"TestCell";
static NSString *const header_id = @"TestHeaderView";
@implementation ViewController{
    NSArray     *_dataSource;
    NSInteger   _leftFlag;
    NSInteger   _rightFlag;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.setTitle(@"Root");
    self.dp_navigationBar().setTitleColor([UIColor redColor]);
    
    UIBarButtonItem *leftItem = DPTitleBarButtonItem(@"改变tabbar背景").addAction(self, @selector(onClickLeftItem));
    leftItem.setFont([UIFont systemFontOfSize:15], UIControlStateNormal).setTitleColor([UIColor redColor], UIControlStateNormal);
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = DPTitleBarButtonItem(@"改变tabbar分割线").addAction(self, @selector(onClickRightItem));
    rightItem.setFont([UIFont systemFontOfSize:15], UIControlStateNormal).setTitleColor([UIColor redColor], UIControlStateNormal);
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.dp_tabBarItem().setTitleColor([UIColor redColor], UIControlStateSelected);
    
    _dataSource = @[@{@"title":@"导航栏相关", @"cls":@"AboutNavigationViewController"},
                    @{@"title":@"UILabel (DPMethodExt)", @"cls":@"LabelExampleController"},
                    @{@"title":@"UIButton (DPMethodExt)", @"cls":@"ButtonExampleViewController"},
                    @{@"title":@"UITextView (DPMethodExt)", @"cls":@"TextViewExampleViewController"},
                    @{@"title":@"UITableView (DPMethodExt)", @"cls":@"TableViewExampleController"}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)onClickLeftItem{
    self.dp_tabBar().setBackgrondImage(_leftFlag % 2 == 0 ? DPImageForColor([UIColor cyanColor]) : nil);
    _leftFlag++;
}

- (void)onClickRightItem{
    self.dp_tabBar().setShadowImage(_rightFlag % 2 == 0 ? DPImageForColor([UIColor redColor]) : nil);
    _rightFlag++;
}

#pragma mark - ---------------------- UITableViewDelegate/UITableDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const identifier = @"UITableViewCell";
    UITableViewCell *cell = tableView.cellForDequeueReusable(identifier);
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.textLabel.setText(_dataSource[indexPath.row][@"title"]);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *nextVC = [NSClassFromString(_dataSource[indexPath.row][@"cls"]) new];
    nextVC.navigationItem.title = _dataSource[indexPath.row][@"title"];
    self.pushViewController(nextVC, YES);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}

@end
