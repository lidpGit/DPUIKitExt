//
//  UIColor+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp 

#import <UIKit/UIKit.h>

@interface UIColor (DPMethodExt)

/**
 创建UIColor

 @param r red值
 @param g green值
 @param b blue值

 @return UIColor
 */
UIColor * RGB(CGFloat r, CGFloat g, CGFloat b);

/**
 创建UIColor
 
 @param r red值
 @param g green值
 @param b blue值
 @param a 透明度
 
 @return UIColor
 */
UIColor * RGBA(CGFloat r, CGFloat g, CGFloat b, CGFloat a);

/**
 创建UIColor

 @param hexStr 十六进制字符串

 @return UIColor
 */
UIColor * DPColorForHex(NSString *hexStr);

/**
 设置颜色透明度
 */
- (UIColor *(^)(CGFloat))setAlpha;

@end
