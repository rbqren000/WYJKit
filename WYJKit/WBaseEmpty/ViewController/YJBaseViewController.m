/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import "YJBaseViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <Masonry/Masonry.h>

@interface YJBaseViewController ()<UIImagePickerControllerDelegate,UIGestureRecognizerDelegate,UINavigationControllerDelegate>
@property(nonatomic, strong)UIImagePickerController *picker;

@property(nonatomic, copy)void (^block)(UIImage *);

@end
@implementation YJBaseViewController

- (YJBaseTableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [YJBaseTableView.alloc initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        
    }
    return _mainTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //防止自动下移64
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    // 防止返回手势失效
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}
- (void) addTableView {
    [self initTableView:UITableViewStyleGrouped];
}
- (void) addTableView:(UITableViewStyle)style configuration:(void(^)(UITableView *))block {
    [self initTableView:style];
    !block ?: block(self.mainTableView);
}

- (void)initTableView:(UITableViewStyle)style {
    self.mainTableView = [YJBaseTableView.alloc initWithFrame: CGRectZero style: style];
    self.mainTableView.estimatedRowHeight = 44.0;
    self.mainTableView.estimatedSectionHeaderHeight = 0.01;
    self.mainTableView.estimatedSectionFooterHeight = 0.01;
    self.mainTableView.showsVerticalScrollIndicator = false;
    self.mainTableView.showsHorizontalScrollIndicator = false;
    self.mainTableView.backgroundColor = WHexColor(@"#F5F5F5");
    self.mainTableView.tableFooterView = [[UIView alloc] init];
    self.mainTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.view addSubview:self.mainTableView];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.navigationController ? kStatusAndNavForHeight : kStatusForHeight);
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.tabBarController.tabBar.isHidden ? -kBottomSafeHeight : -kBottomSafeAndTabBarForHeight);
    }];
}
- (void)setYi_barStyle:(UIStatusBarStyle)yi_barStyle {
    _yi_barStyle = yi_barStyle;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.yi_barStyle;
}
#pragma mark -----  调用系统相册、拍照上传图片 -----
- (void)yi_setUploadPictures:(void(^)(UIImage *))bloack {
    self.block = bloack;
    __block typeof (self) weak_self = self;
    self.picker = [[UIImagePickerController alloc] init];
    self.picker.delegate = self;
    self.picker.allowsEditing = YES;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择图片"
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {}];
    UIAlertAction* fromPhotoAction = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault                                                                 handler:^(UIAlertAction * action) {
        weak_self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [weak_self presentViewController:weak_self.picker animated:YES completion:nil];
        NSLog(@"从相册选择");
    }];
    UIAlertAction* fromCameraAction = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault                                                             handler:^(UIAlertAction * action) {
        NSLog(@"相机");
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if(! [UIImagePickerController isSourceTypeAvailable:sourceType]){
            NSString *tips = @"相机不可用";
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"无法使用相机" message:tips preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                NSLog(@"取消");
            }];
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                NSLog(@"确定");
            }];
            [alertController addAction:cancelAction];
            [alertController addAction:otherAction];
            [weak_self presentViewController:alertController animated:YES completion:nil];
            return;
        }
        weak_self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [weak_self presentViewController:weak_self.picker animated:YES completion:nil];
        if (![weak_self getCameraRecordPermisson]) {
            NSString *tips = @"请在iPhone的“设置-隐私-相机”中允许访问相机";
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"无法使用相机" message:tips preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                NSLog(@"取消");
            }];
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                NSLog(@"确定");
            }];
            [alertController addAction:cancelAction];
            [alertController addAction:otherAction];
            [weak_self presentViewController:alertController animated:YES completion:nil];
        }
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:fromCameraAction];
    [alertController addAction:fromPhotoAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark UIImagePickerControllerDelegate
//选择图或者拍照后的回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    //原图
    UIImage *orignalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    //编辑后的图片
    UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    // 拍照后保存原图片到相册中
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera && orignalImage) {
        UIImageWriteToSavedPhotosAlbum(orignalImage, self, nil, NULL);
    }
    //上传照片
    [picker dismissViewControllerAnimated:YES completion:^{
        if (editedImage) {
            if (self.block) {
                self.block(editedImage);
            }
        }
    }];
}

- (BOOL)getCameraRecordPermisson {
    NSString * mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus  authorizationStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if (authorizationStatus == AVAuthorizationStatusRestricted|| authorizationStatus == AVAuthorizationStatusDenied) {
        return NO;
    }
    return YES;
}

@end

