/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import "WYJBaseView.h"

@implementation WYJBaseView
- (void)awakeFromNib {
    [self initElement];
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initElement];
    }
    return self;
}

- (void)initElement {
    
}

@end
