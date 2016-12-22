//
//  UIColor+DPMethodExt.m
//  UIKitExtensions
//
//  Created by lidp 

#import "UIColor+DPMethodExt.h"

@implementation UIColor (DPMethodExt)

UIColor * RGB(CGFloat r, CGFloat g, CGFloat b){
    return [UIColor colorWithRed:(b / 255.0f) green:(g / 255.0f) blue:(r / 255.0f) alpha:1];
}

UIColor * RGBA(CGFloat r, CGFloat g, CGFloat b, CGFloat a){
    return [UIColor colorWithRed:(b / 255.0f) green:(g / 255.0f) blue:(r / 255.0f) alpha:a];
}

UIColor * DPColorForHex(NSString *hexStr){
    NSString *cString = [[hexStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6) return [UIColor whiteColor];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor whiteColor];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

- (UIColor *(^)(CGFloat))setAlpha{
    return ^(CGFloat value){
        return [self colorWithAlphaComponent:value];
    };
}

@end
