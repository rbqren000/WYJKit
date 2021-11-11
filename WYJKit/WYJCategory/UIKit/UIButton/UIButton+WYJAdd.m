/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import "UIButton+WYJAdd.h"
#import <objc/runtime.h>
static const char TitleFontSizeKey;
static const char TitleFontKey;
static const char TitleKey;
static const char TitleColorKey;
static const char SelectTitleKey;
static const char SelectTitleColorKey;
static const char BackgroundImageKey;
static const char SelectBackgroundImageKey;
static const char ImageKey;
static const char SelectImageKey;
static const char AttributedTextKey;
static const char SelectAttributedTextKey;
static const char TextAlignementKey;



@implementation UIButton (WYJAdd)

- (void)addTargetUpInside:(id)tat action:(SEL)sel {
    [self addTarget:tat action:sel forControlEvents:UIControlEventTouchUpInside];
}

- (void)imagePosition:(WYJImagePosition)postitionStatus spacing:(CGFloat)spacing {
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWith + labelWidth) / 2 - imageWith / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 - spacing;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWith + labelWidth / 2) - (imageWith + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing * 2;//label中心移动的y距离
    
    switch (postitionStatus) {
        case WYJImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            break;
            
        case WYJImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + spacing/2), 0, imageHeight + spacing/2);
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            break;
            
        case WYJImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            break;
            
        case WYJImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            break;
            
        default:
            break;
    }
}

#pragma make ------ runtime ------
- (void)setTitleFont:(CGFloat)titleFont {
    objc_setAssociatedObject(self, &TitleFontSizeKey, @(titleFont), OBJC_ASSOCIATION_ASSIGN);
    self.titleLabel.font = [UIFont systemFontOfSize:titleFont];
}
- (CGFloat)titleFont {
    return [objc_getAssociatedObject(self, &TitleFontSizeKey) floatValue];
}

- (void)setFont:(UIFont *)font {
    objc_setAssociatedObject(self, &TitleFontKey, font, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.titleLabel.font = font;
}
- (UIFont *)font {
    return objc_getAssociatedObject(self, &TitleFontKey);
}

- (void)setTitleText:(NSString *)titleText {
    objc_setAssociatedObject(self, &TitleKey, titleText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setTitle:titleText forState:UIControlStateNormal];
}
- (NSString *)titleText {
    return objc_getAssociatedObject(self, &TitleKey);
}

- (void)setTitleColor:(UIColor *)titleColor {
    objc_setAssociatedObject(self, &TitleColorKey, titleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setTitleColor:titleColor forState:UIControlStateNormal];
}
- (UIColor *)titleColor {
    return objc_getAssociatedObject(self, &TitleColorKey);
}

- (void)setSelectTitle:(NSString *)selectTitle {
    objc_setAssociatedObject(self, &SelectTitleKey, selectTitle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setTitle:selectTitle forState:UIControlStateSelected];
}
- (NSString *)selectTitle {
    return objc_getAssociatedObject(self, &SelectTitleKey);
}

- (void)setSelectTitleColor:(UIColor *)selectTitleColor {
    objc_setAssociatedObject(self, &SelectTitleColorKey, selectTitleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setTitleColor:selectTitleColor forState:UIControlStateSelected];
}
- (UIColor *)selectTitleColor {
    return objc_getAssociatedObject(self, &SelectTitleColorKey);
}

- (void)setBackgroundImage:(UIImage *)backgroundImage{
    objc_setAssociatedObject(self, &BackgroundImageKey, backgroundImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
}
- (UIImage *)backgroundImage {
    return objc_getAssociatedObject(self, &BackgroundImageKey);
}

- (void)setSelectBackgroundImage:(UIImage *)selectBackgroundImage {
    objc_setAssociatedObject(self, &SelectBackgroundImageKey, selectBackgroundImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setBackgroundImage:selectBackgroundImage forState:UIControlStateSelected];
}
- (UIImage *)selectBackgroundImage {
    return objc_getAssociatedObject(self, &SelectBackgroundImageKey);
}

- (void)setImage:(UIImage *)image {
    objc_setAssociatedObject(self, &ImageKey, image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setImage:image forState:UIControlStateNormal];
}
- (UIImage *)image {
    return objc_getAssociatedObject(self, &ImageKey);
}

- (void)setSelectImage:(UIImage *)selectImage {
    objc_setAssociatedObject(self, &SelectImageKey, selectImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setImage:selectImage forState:UIControlStateSelected];
}
- (UIImage *)selectImage {
    return objc_getAssociatedObject(self, &SelectImageKey);
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    objc_setAssociatedObject(self, &AttributedTextKey, attributedText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setAttributedTitle:attributedText forState:UIControlStateNormal];
}
- (NSAttributedString *)attributedText {
    return objc_getAssociatedObject(self, &AttributedTextKey);
}

- (void)setSelectAttributedText:(NSAttributedString *)selectAttributedText {
    objc_setAssociatedObject(self, &SelectAttributedTextKey, selectAttributedText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setAttributedTitle:selectAttributedText forState:UIControlStateSelected];
}
- (NSAttributedString *)selectAttributedText {
    return objc_getAssociatedObject(self, &SelectAttributedTextKey);
}

- (void)setTextAlignement:(WYJTextAlignement)textAlignement {
    objc_setAssociatedObject(self, &TextAlignementKey, @(textAlignement), OBJC_ASSOCIATION_ASSIGN);
    if (textAlignement == WYJTextAlignmentLeft) {
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    } else if (textAlignement == WYJTextAlignmentCenter) {
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    } else {
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
}
- (WYJTextAlignement)textAlignement {
    return [objc_getAssociatedObject(self,&TextAlignementKey) integerValue];
}

@end