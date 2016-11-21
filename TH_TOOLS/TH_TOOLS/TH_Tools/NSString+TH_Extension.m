//
//  NSString+TH_Extension.m
//  TH_TOOLS
//
//  Created by Tele-hot-Cheng on 2016/11/15.
//  Copyright © 2016年 Tele-hot-Cheng. All rights reserved.
//

#import "NSString+TH_Extension.h"
#import<CommonCrypto/CommonDigest.h>

@implementation NSString (TH_Extension)

/**
 计算文件大小

 @return return value description
 */
- (unsigned long long)th_fileSize{
    //创建文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    //查看文件类型
    NSDictionary *atts = [mgr attributesOfItemAtPath:self error:nil];
    NSString *fileType = atts.fileType;
    
    if ([fileType isEqualToString:NSFileTypeDirectory]) {
        //获取文件夹遍历器
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        //总大小
        unsigned long long fileSize = 0;
        //遍历所有子路径
        for (NSString *subpath in enumerator) {
            //获取子路径的全路径
            NSString *fullPath = [self stringByAppendingPathComponent:subpath];
            fileSize += [mgr attributesOfItemAtPath:fullPath error:nil].fileSize;
        }
        return fileSize;
    }

    //返回文件大小
    return atts.fileSize;
    
}


-(CGFloat)th_widthWithFont:(UIFont *)font MaxWidth:(CGFloat)width{
    NSDictionary *attribute = @{NSFontAttributeName:font};
    CGSize retSize = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                       options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                    attributes:attribute
                                       context:nil].size;
    return retSize.width;
}


-(CGFloat)th_heightWithFont:(UIFont *)font MaxWidth:(CGFloat)width{
    NSDictionary *attribute = @{NSFontAttributeName:font};
    CGSize retSize = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                        options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    return retSize.height;
}

-(CGSize)th_sizeWithFont:(UIFont *)font MaxWidth:(CGFloat)width{
    NSDictionary *attribute = @{NSFontAttributeName:font};
    CGSize retSize = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                        options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    return retSize;
}

//md5加密
-(NSString *)th_md5:(NSString *)input{
    const char *cStr = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];

}

@end
