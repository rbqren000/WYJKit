//
//  BaseTitleTableViewCell.m
//  LCProduct
//
//  Created by 王祎境 on 2024/6/22.
//

#import "WYJBaseTitleTableViewCell.h"
#import <Masonry/Masonry.h>
#import "WYJMacroHeader.h"
#import "UIColorHeader.h"
#import "UIFontHeader.h"
#import "UILabelHeader.h"

@implementation WYJBaseTitleTableViewCell

- (void)initElement {
    [self.bgView addSubview:self.titLabel];
    [self.titLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(self.bgView);
        make.top.mas_equalTo(YJRatio(12));
    }];
    [self.bgView addSubview:self.descLabel];
    if (self.showNext) {
        [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.nextImageView.mas_left).offset(-YJRatio(5));
            make.centerY.mas_equalTo(self.bgView);
            make.left.mas_equalTo(self.titLabel.mas_right).offset(YJRatio(12));
        }];
    } else {
        [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-15);
            make.centerY.mas_equalTo(self.bgView);
            make.left.mas_equalTo(self.titLabel.mas_right).offset(YJRatio(12));
        }];
    }
    self.bgSpace = 0;
}

- (UILabel *)titLabel {
    if (!_titLabel) {
        _titLabel = [UILabel yi_createWithText:@"" color:WHexColor(0x212121) font:WYJSysFontWithSizes(14)];
        [_titLabel setContentHuggingPriority:(UILayoutPriorityRequired) + 1 forAxis:(UILayoutConstraintAxisHorizontal)];
    }
    return _titLabel;
}
- (UILabel *)descLabel {
    if (!_descLabel) {
        _descLabel = [UILabel yi_createWithText:@"" color:WHexColor(0x848484) font:WYJSysFontWithSizes(12)];
        _descLabel.textAlignment = NSTextAlignmentRight;
    }
    return _descLabel;
}
@end
