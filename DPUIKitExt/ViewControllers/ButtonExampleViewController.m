//
//  ButtonExampleViewController.m
//  UIKitExtensions
//
//  Created by lidp 

#import "ButtonExampleViewController.h"
#import "DPUIKitMethodExt.h"

@interface ButtonExampleViewController ()

@end

@implementation ButtonExampleViewController

- (void)dealloc{
    NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.setBackgroundColor([UIColor whiteColor]);
    self.navigationItem.setTitle(@"四种按钮布局");
    
    //布局1：图片上，标题下
    UIButton *btn = DPLayoutButton(10, DPBtnLayoutTypeUpImageDownTitle).setFrame(CGRectMake(20, 100, 120, 120));
    btn.setTitle(@"标题", UIControlStateNormal).setTitleColor([UIColor blackColor], UIControlStateNormal);
    btn.setNormalImage(DPImageForName(@"test")).setSelectedImage(DPImageForName(@"test3"));
    //设置不同状态下的背景颜色
    btn.setBackgroundColor([UIColor orangeColor], UIControlStateNormal).
        setBackgroundColor([UIColor cyanColor], UIControlStateHighlighted).
        setBackgroundColor([UIColor magentaColor], UIControlStateSelected);
    btn.addClickAction(self, @selector(onClickBtn:));
    self.view.addSubview(btn);
    
    //布局2：标题上，图片下
    btn = DPLayoutButton(10, DPBtnLayoutTypeUpTitleDownImage).setFrame(CGRectMake(160, 100, 120, 120)).setBackgroundColor([UIColor cyanColor], UIControlStateNormal);
    btn.setNormalImage(DPImageForName(@"test")).
        setTitle(@"标题", UIControlStateNormal).
        setTitleColor([UIColor blackColor], UIControlStateNormal);
    self.view.addSubview(btn);
    
    //布局3：图片左，标题右
    btn = DPLayoutButton(10, DPBtnLayoutTypeLeftImageRightTitle).setFrame(CGRectMake(20, 240, 120, 120)).setBackgroundColor([UIColor cyanColor], UIControlStateNormal);
    btn.setNormalImage(DPImageForName(@"test")).
    setTitle(@"标题", UIControlStateNormal).
    setTitleColor([UIColor blackColor], UIControlStateNormal);
    self.view.addSubview(btn);
    
    //布局4：标题左，图片右
    btn = DPLayoutButton(10, DPBtnLayoutTypeLeftTitleRightImage).setFrame(CGRectMake(160, 240, 120, 120)).setBackgroundColor([UIColor cyanColor], UIControlStateNormal);
    btn.setNormalImage(DPImageForName(@"test")).
    setTitle(@"标题", UIControlStateNormal).
    setTitleColor([UIColor blackColor], UIControlStateNormal);
    self.view.addSubview(btn);
}

- (void)onClickBtn:(UIButton *)sender{
    sender.selected = !sender.selected;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
