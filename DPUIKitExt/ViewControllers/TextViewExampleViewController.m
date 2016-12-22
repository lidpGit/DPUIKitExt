//
//  TextViewExampleViewController.m
//  UIKitExtensions
//
//  Created by lidp 

#import "TextViewExampleViewController.h"
#import "DPUIKitMethodExt.h"

@interface TextViewExampleViewController ()

@end

@implementation TextViewExampleViewController

- (void)dealloc{
    NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.setBackgroundColor(RGB(240, 240, 240));
    self.navigationItem.setTitle(@"UITextView加Placeholder");
    self.automaticallyAdjustsScrollViewInsets = NO; //不设置此属性，textview会自动偏移64
    
    UITextView *textView = DPTextView().setTextColor([UIColor redColor]).setFont([UIFont systemFontOfSize:15]);
    textView.setBackgroundColor([UIColor whiteColor]).
        setFrame(CGRectMake(15, 80, self.view.viewWidth - 30, 200)).
        setCornerRadius(5);
    
    textView.setPlaceholderText(@"输入内容").
        setPlaceholderTextColor(RGB(140, 140, 140)).
        setPlaceholderTextFont([UIFont systemFontOfSize:15]);
    
    self.view.addSubview(textView);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.view.endEditing(YES);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
