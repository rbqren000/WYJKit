/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import <UIKit/UIKit.h>



@interface UIImageView (YJAdd)

/** image name */
@property (nonatomic, copy)NSString * imageName;

@property (nonatomic, copy)NSString * base64Image;

- (void)addTouchUpInside:(void(^)(void))block;
@end


