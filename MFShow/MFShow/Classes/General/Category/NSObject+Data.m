//
//  NSObject+Data.m
//  MFShow
//
//  Created by Meng Fan on 16/12/26.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "NSObject+Data.h"

@implementation NSObject (Data)

- (int)getIntValue
{
    float ret = 0;
    if ([self isKindOfClass:[NSString class]])
    {
        ret = [(NSString*)self intValue];
    }
    else if ([self isKindOfClass:[NSNumber class]])
    {
        ret = [(NSNumber*)self intValue];
    }
    
    return ret;
}

- (float)getBoolValue
{
    float ret = 0;
    if ([self isKindOfClass:[NSString class]])
    {
        ret = [(NSString*)self boolValue];
    }
    else if ([self isKindOfClass:[NSNumber class]])
    {
        ret = [(NSNumber*)self boolValue];
    }
    
    return ret;
}

- (long)getLongValue
{
    float ret = 0;
    if ([self isKindOfClass:[NSString class]])
    {
        ret = [(NSString*)self longLongValue];
    }
    else if ([self isKindOfClass:[NSNumber class]])
    {
        ret = [(NSNumber*)self longValue];
    }
    
    return ret;
}


- (float)getFloatValue
{
    float ret = 0;
    if ([self isKindOfClass:[NSString class]])
    {
        ret = [(NSString*)self floatValue];
    }
    else if ([self isKindOfClass:[NSNumber class]])
    {
        ret = [(NSNumber*)self floatValue];
    }
    
    return ret;
}

@end
