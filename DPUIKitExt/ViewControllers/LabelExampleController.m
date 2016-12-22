//
//  LabelExampleController.m
//  UIKitExtensions
//
//  Created by lidp

#import "LabelExampleController.h"
#import "DPUIKitMethodExt.h"

@interface LabelExampleController ()

@end

@implementation LabelExampleController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.setBackgroundColor([UIColor whiteColor]);
    self.navigationItem.setTitle(@"UILabel富文本");
    
    NSString *text = @"宏定义在C系开发中可以说占有举足轻重的作用。底层框架自不必说，为了编译优化和方便，以及跨平台能力，宏被大量使用，可以说底层开发离开define将寸步难行。而在更高层级进行开发时，我们会将更多的重心放在业务逻辑上，似乎对宏的使用和依赖并不多。但是使用宏定义的好处是不言自明的，在节省工作量的同时，代码可读性大大增加。如果想成为一个能写出漂亮优雅代码的开发者，宏定义绝对是必不可少的技能（虽然宏本身可能并不漂亮优雅XD）";
    
    UILabel *label = DPLabel().setFont([UIFont systemFontOfSize:15]).
                            setLine(0).
                            setText(text).
                            setMaxWidth(self.view.viewWidth - 20);
    
    label.setViewPoint(CGPointMake(10, 80));
    
    label.setSpanColor(NSMakeRange(0, 22), [UIColor redColor]).
        setSpanColor(NSMakeRange(22, 9), [UIColor orangeColor]).
        setLineSpacing(10).
        setFirstLineHeadIndent(20);
    
    self.view.addSubview(label);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
