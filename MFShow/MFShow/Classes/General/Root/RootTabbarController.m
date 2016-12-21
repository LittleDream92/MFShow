//
//  RootTabbarController.m
//  MFShow
//
//  Created by Meng Fan on 16/12/21.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "RootTabbarController.h"




@interface RootTabbarController ()

@end

@implementation RootTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置tabbar背景
//    self.tabBar.backgroundImage = stretchableImage(@"tab_bg.png");
    self.tabBar.barTintColor = RGB(247, 247, 247);
    
    //设置Item选中状态的图片
    NSArray *itemSelectedImageNameArray = @[@"tab_icon_photo_p",@"tab_icon_text_p",@"tab_icon_subject_p",@"tab_icon_me_p"];
    
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        for (NSInteger index =0; index < [self.viewControllers count]; index++) {
            UIViewController* viewCtrl = [self.viewControllers objectAtIndex:index];
            viewCtrl.tabBarItem.selectedImage = [[UIImage imageNamed:[itemSelectedImageNameArray objectAtIndex:index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            [viewCtrl.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(113, 107, 104)
                                                         , NSForegroundColorAttributeName,
                                                         nil] forState:UIControlStateNormal];
            [viewCtrl.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB(255, 106, 83), NSForegroundColorAttributeName,
                                                         nil] forState:UIControlStateHighlighted];
        }
        self.tabBar.translucent = NO;
    }
    
}

#pragma mark - systemViewMethods
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //修改tabbar上部的线条
    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:[UIImageView class]] && view.bounds.size.height <= 2) {
            UIImageView *ima = (UIImageView *)view;
            ima.backgroundColor = RGB(200, 200, 200);
//            ima.hidden = YES;
        }
    }
}



#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
