/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <UIKit/UIKit.h>
#import "WYJBaseTableView.h"
//#import "WYJFrameMacro.h"
NS_ASSUME_NONNULL_BEGIN

@interface WYJBaseViewController : UIViewController
@property (strong, nonatomic) WYJBaseTableView * mainTableView;
@property (nonatomic,assign) UIStatusBarStyle barStyle;

- (void)yi_setUploadPictures:(void(^)(UIImage * img))bloack;

#pragma mark -----  添加tableview -----
///添加tableview
- (void)addTableView;
///添加tableview
- (void)addTableView:(UITableViewStyle)style configuration:(void(^)(UITableView *))block;
@end

NS_ASSUME_NONNULL_END
