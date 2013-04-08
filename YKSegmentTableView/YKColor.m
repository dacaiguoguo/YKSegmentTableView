//
//  YKColor.m
//  VANCL
//
//  Created by cui liang wei on 12-3-21.
//  Copyright (c) 2012年 yek. All rights reserved.
//

#import "YKColor.h"

@implementation YKColor

+ (UIColor *)getColor:(NSString *)hexColor
{
	unsigned int red,green,blue;
	NSRange range;
	range.length = 2;
	
	range.location = 0;
	[[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
	
	range.location = 2;
	[[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
	
	range.location = 4;
	[[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
	
	return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
}

+ (UIColor *)getBackgroundColor
{
    return [YKColor getColor:kBackgroundColor];
}

+ (UIColor *)getSeparatorLineColor
{
    return [YKColor getColor:kSeparatorLineColor];
}

+ (UIColor *)getEnableButtonColor
{
    return [YKColor getColor:kEnableButtonColor];
}

+ (UIColor *)getDisableButtonColor 
{
    return [YKColor getColor:kDisabledButtonColor];
}

@end

