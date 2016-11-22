//
//  UIView+TH_Extension.h
//  TH_TOOLS
//
//  Created by Tele-hot-Cheng on 2016/11/16.
//  Copyright © 2016年 Tele-hot-Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TH_Extension)
/**x*/
@property (nonatomic, assign) CGFloat x;

/**y*/
@property (nonatomic, assign) CGFloat y;

/**centerX*/
@property (nonatomic, assign) CGFloat centerX;

/**centerY*/
@property (nonatomic, assign) CGFloat centerY;

/**width*/
@property (nonatomic, assign) CGFloat width;

/**height*/
@property (nonatomic, assign) CGFloat height;

/**size*/
@property (nonatomic, assign) CGSize size;

/**视图顶部*/
@property(nonatomic, assign) CGFloat top;

/**视图左部*/
@property(nonatomic, assign)CGFloat left;

/**视图底部*/
@property(nonatomic, assign)CGFloat bottom;

/**视图右部*/
@property(nonatomic, assign)CGFloat right;

/**视图左下的点坐标*/
@property (readonly) CGPoint bottomLeft;

/**视图的右下坐标*/
@property (readonly) CGPoint bottomRight;

/**视图的上右坐标*/
@property (readonly) CGPoint topRight;

@end
