//
//  AboutNavigationViewController.m
//  UIKitExtensions
//
//  Created by lidp 

#import "AboutNavigationViewController.h"
#import "DPUIKitMethodExt.h"

#define rightItemTitle(isHidden) (isHidden ? @"显示分割线" : @"隐藏分割线")

@interface AboutNavigationViewController ()

@end

@implementation AboutNavigationViewController{
    UIBarButtonItem *_rightItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.setBackgroundColor([UIColor cyanColor]);
    
    UIBarButtonItem *leftItem = DPTitleBarButtonItem(@"pop").
                                    setTitleColor([UIColor whiteColor], UIControlStateNormal).
                                    setFont([UIFont systemFontOfSize:15], UIControlStateNormal).
                                    addAction(self, @selector(onClickLeftItem));
    
    NSString *title = rightItemTitle(self.navigationController.navigationBar.isHiddenShadowImage);
    UIBarButtonItem *rightItem = DPTitleBarButtonItem(title).
                                    setTitleColor([UIColor whiteColor], UIControlStateNormal).
                                    setFont([UIFont systemFontOfSize:15], UIControlStateNormal).
                                    addAction(self, @selector(onClickRightItem));
    _rightItem = rightItem;
    
    self.navigationItem.setTitle(@"导航栏相关").setLeftItem(leftItem).setRightItem(rightItem);
    
    self.dp_navigationBar().setTitleColor([UIColor orangeColor]);
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.dp_navigationBar().setShadowImage(DPImageForColor([UIColor redColor])).setBackgroundColor([UIColor brownColor]);
//    self.dp_navigationBar().setShadowImage(DPImageForColor([UIColor redColor])).setBackgroundImage(DPImageForColor([UIColor brownColor]));
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.dp_navigationBar().setShadowImage(nil).setBackgroundColor(nil);
//    self.dp_navigationBar().setShadowImage(nil).setBackgroundImage(nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)onClickLeftItem{
    self.popViewController(YES);
}

- (void)onClickRightItem{
    UINavigationBar *bar = self.dp_navigationBar();
    self.dp_navigationBar().setHiddenShadowImage(!bar.isHiddenShadowImage);
    
    _rightItem.setTitle(rightItemTitle(bar.isHiddenShadowImage));
}

@end
