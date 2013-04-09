//
//  YKBaseModel.m
//  YKModule
//
//  Created by TFH on 13-4-1.
//  Copyright (c) 2013年 YEK. All rights reserved.
//

#import "YKBaseModel.h"



@implementation YKEntity{
    NSMutableDictionary* attrDic;
}

-(id)init{
    self=[super init];
    if(self){
        attrDic=[[NSMutableDictionary alloc] init];
    }
    return self;
}
-(void)setAttributeValue:(NSString *)v forKey:(NSString *)akey{
    [attrDic setObject:v forKey:akey];
}
-(NSString *)attributeValueForKey:(NSString *)akey{
    return [attrDic objectForKey:akey];
}
@end


@implementation YKAddress
@end

@implementation YKBrand

@end

@implementation YKCart

@end


@implementation YKCategory


@end
@implementation YKHome


@end

@implementation YKOrder


@end
@implementation YKProduct


@end
@implementation YKProductSize


@end
@implementation YKProductColor


@end


@implementation YKProductList

@end

@implementation YKComment

@end


@implementation YKSecKill


@end

@implementation YKTopic

@end

@implementation YKUser


@end

@implementation YKGroup


@end


@implementation YKNotice
@end


