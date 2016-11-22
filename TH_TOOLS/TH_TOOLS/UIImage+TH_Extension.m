//
//  UIImage+TH_Extension.m
//  TH_TOOLS
//
//  Created by Tele-hot-Cheng on 2016/11/15.
//  Copyright © 2016年 Tele-hot-Cheng. All rights reserved.
//

#import "UIImage+TH_Extension.h"

@implementation UIImage (TH_Extension)

/**
 *  传入图片名称,返回拉伸好的图片
 */
+ (UIImage *)th_resizeImage:(NSString *)imageName
{
    return [[UIImage imageNamed:imageName] resizeImage];
}

- (UIImage *)resizeImage
{
    CGFloat width = self.size.width * 0.5;
    CGFloat height = self.size.height * 0.5;
    return [self stretchableImageWithLeftCapWidth:width topCapHeight:height];
}


/**
 * 对象方法,返回一张圆形图片
 */
- (instancetype)circleImage{
    //开启图形上下文
    UIGraphicsBeginImageContext(self.size);
    //获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //矩形框
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    //添加一个圆
    CGContextAddEllipseInRect(ctx, rect);
    // 裁剪(裁剪成刚才添加的图形形状)
    CGContextClip(ctx);
    //往圆上添加一张图片
    [self drawInRect:rect];
    //获得上下文中生成的图片
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return image;
}

/**
 * 类方法,返回一张圆形图片
 */
+ (instancetype)circleImageNamed:(NSString *)name{
    
    return [[self circleImageNamed:name] circleImage];
}

//返回固定尺寸的UIImage
-(UIImage*)th_originImage:(UIImage *)image scaleToSize:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    
    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}

//模糊效果
- (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur{
    
    CIImage *inputImage = [CIImage imageWithCGImage:image.CGImage];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"
                        
                                  keysAndValues:kCIInputImageKey,inputImage,@"inputRadius",@(blur),nil];
    
    CIImage *outPutImage = filter.outputImage;
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CGImageRef outImage = [context createCGImage:outPutImage fromRect:[inputImage extent]];
    
    return [UIImage imageWithCGImage:outImage];
}


//根据网路url获取image
-(UIImage *)th_imageWithUrlString:(NSString *)url{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *image = [UIImage imageWithData:data];
    return image;
}


//加载本地图片
-(UIImage *)th_loadFileImage:(NSString *)imageName type:(NSString *)type{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:imageName ofType:type];
    NSData *image = [NSData dataWithContentsOfFile:filePath];
    return [UIImage imageWithData:image];
}

//根据颜色创建image
+(UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}



@end
