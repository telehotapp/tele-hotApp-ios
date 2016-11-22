//
//  UIImage+TH_Extension.h
//  TH_TOOLS
//
//  Created by Tele-hot-Cheng on 2016/11/15.
//  Copyright © 2016年 Tele-hot-Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TH_Extension)

//传入图片名称,返回拉伸好的图片
+ (UIImage *)th_resizeImage:(NSString *)imageName;

//输入文件名，返回个圆形图片
+ (instancetype)circleImageNamed:(NSString *)name;

//返回固定图片的高度
-(UIImage*)th_originImage:(UIImage *)image scaleToSize:(CGSize)size;

//模糊效果
- (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;

//文件路径获取图片
-(UIImage *)th_loadFileImage:(NSString *)imageName type:(NSString *)type;

/**根据网络链接请求图片*/
-(UIImage *)th_imageWithUrlString:(NSString *)url;

/**根据颜色值创建一张图片*/
+(UIImage *)imageWithColor:(UIColor *)color;

@end
