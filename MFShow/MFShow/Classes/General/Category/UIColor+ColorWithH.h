//
//  UIColor+ColorWithH.h
//  MFShow
//
//  Created by Meng Fan on 16/12/23.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorWithH)

/**
 *  通过16进制设置颜色 
 *
 *  @param inColorString    16进制字符串
 */
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString;

@end
