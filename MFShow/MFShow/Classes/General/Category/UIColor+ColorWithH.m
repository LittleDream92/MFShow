//
//  UIColor+ColorWithH.m
//  MFShow
//
//  Created by Meng Fan on 16/12/23.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "UIColor+ColorWithH.h"

@implementation UIColor (ColorWithH)

/**
 *  通过16进制设置颜色
 *
 *  @param inColorString    16进制字符串
 */
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString {
    
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];
    return result;
}

@end
