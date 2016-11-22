//
//  NSString+TH_Extension.h
//  TH_TOOLS
//
//  Created by Tele-hot-Cheng on 2016/11/15.
//  Copyright © 2016年 Tele-hot-Cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (TH_Extension)

/**根据文件名，计算文件大小*/
- (unsigned long long)th_fileSize;

/**根据文字的大小和字数返回字符串width*/
-(CGFloat)th_widthWithFont:(UIFont *)font MaxWidth:(CGFloat)width;

/**根据文字的大小和字数返回字符串heiht*/
-(CGFloat)th_heightWithFont:(UIFont *)font MaxWidth:(CGFloat)width;

/**根据文字的大小和字数返回字符串size*/
-(CGSize)th_sizeWithFont:(UIFont *)font MaxWidth:(CGFloat)width;

/**md5加密*/
-(NSString *)th_md5:(NSString *)input;




@end
