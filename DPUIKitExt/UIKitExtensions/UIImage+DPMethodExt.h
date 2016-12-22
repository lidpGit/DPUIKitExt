//
//  UIImage+DPMethodExt.h
//  UIKitExtensions
//
//  Created by lidp

#import <UIKit/UIKit.h>

@interface UIImage (DPMethodExt)

/**
 创建UIImage

 @param name 图片名称

 @return UIImage
 */
UIImage * DPImageForName(NSString *name);

/**
 创建UIImage

 @param color 颜色

 @return UIImage
 */
UIImage * DPImageForColor(UIColor *color);

/**
 旋转并压缩图片

 @param image 原图
 @param asize 设置的图片大小

 @return 新图片
 */
+ (UIImage *)thumbnailWithImage:(UIImage *)image size:(CGSize)asize;

/**
 按高/宽比例裁剪图片，以图片中心点向边缘裁剪

 @param ratio       高/宽的比例，要裁剪正方形比例传1
 @param sourceImage 原图片

 @return 裁剪后的图片
 */
+ (UIImage *)imageWithRatio:(CGFloat)ratio sourceImage:(UIImage *)sourceImage;


/**
 指定最大字节数压缩图片

 @param image    原图
 @param maxByte  最大字节数
 @param callback 压缩后回调
 */
+ (void)compressMessageImage:(UIImage *)image maxByte:(long long)maxByte callback:(void (^)(UIImage *result, NSData *data))callback;

@end
