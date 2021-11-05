/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import "NSArray+WYJConversion.h"

@implementation NSArray (WYJConversion)
- (NSString *)toString {
    return [self toStringBy:@","];
}
- (NSString *)toStringBy:(NSString *)string {
    return [self componentsJoinedByString:string];
}
@end