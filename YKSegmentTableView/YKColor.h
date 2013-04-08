//
//  YKColor.h
//  VANCL
//
//  Created by cui liang wei on 12-3-21.
//  Copyright (c) 2012年 yek. All rights reserved.
//

#import <Foundation/Foundation.h>

//background color
#define kBackgroundColor                @"f3f4f6"

//text color
#define kTextDarkBlackColor             @"3d3d3d"
#define kTextShallowBlackColor          @"666666"
#define kTextRedColor                   @"d61229"
#define kShopCarRedColor                @"d61229"

//separator color
#define kSeparatorLineColor             @"c0c0c0"

//button color
#define kEnableButtonColor              @"ffffff"
#define kDisabledButtonColor            @"a6a5a5"

//image
#define kImageBorderColor               @"c5c5c5"

@interface YKColor : UIColor {
    
}

/**
 *	@brief	根据色值返回UIColor对象
 *
 *	@param 	hexColor 	色值
 *
 *	@return	色值hexColor对应的UIColor对象
 */
+ (UIColor *)getColor:(NSString *)hexColor;

/**
 *	@brief	返回色值#f3f4f6的UIColor对象
 *
 *	@return	色值#f3f4f6对应UIColor对象
 */
+ (UIColor *)getBackgroundColor;

/**
 *	@brief	返回色值#c0c0c0的UIColor对象
 *
 *	@return	色值#c0c0c0对应UIColor对象
 */
+ (UIColor *)getSeparatorLineColor;

/**
 *	@brief	返回色值#ffffff的UIColor对象
 *
 *	@return	色值#ffffff对应UIColor对象
 */
+ (UIColor *)getEnableButtonColor;

/**
 *	@brief	返回色值#a6a5a5的UIColor对象
 *
 *	@return	色值#a6a5a5对应UIColor对象
 */
+ (UIColor *)getDisableButtonColor;

@end
