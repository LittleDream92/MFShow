//
//  PersonalTableViewController.m
//  MFShow
//
//  Created by Meng Fan on 16/12/21.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "PersonalTableViewController.h"

@interface PersonalTableViewController () <UINavigationControllerDelegate>

@end

@implementation PersonalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        self.tableView.backgroundView = nil;
        self.tableView.backgroundColor = kDefaultBackgroundColor;
    }
    
    //设置导航栏
    [self setUpNav];
}

#pragma mark - setUpViews
- (void)setUpNav {
    //设置导航栏代理
    self.navigationController.delegate = self;
}

#pragma mark - Table view data source

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        CGFloat height = kScreenWidth *(369.0/720.0);
        return height;
    }
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = kDefaultBackgroundColor;
    switch (section) {
        case 0:
        {
            UIImageView *imageView = [UIImageView new];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.clipsToBounds = YES;
            imageView.image = [UIImage imageNamed:@"settiing_bk"];
            return imageView;
        }break;
            
        default:
            break;
    }
    return view;
}


#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (viewController ==  self) {
        UIApplication* app = [UIApplication sharedApplication];
        if (app.statusBarHidden) {
            app.statusBarHidden = NO;
        }
        [navigationController setNavigationBarHidden:YES animated:animated];
        if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
            [navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
            navigationController.navigationBar.translucent = NO;
            navigationController.navigationBar.barTintColor = [UIColor whiteColor];
            navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
        }
    }
//    else if ([viewController isKindOfClass:[ShowPictureListViewController class]] || [viewController isKindOfClass:[ShowPictureViewController class]]) {
//        [[UIApplication sharedApplication] setStatusBarHidden:YES];
//        [navigationController setNavigationBarHidden:YES animated:NO];
//    } else if ( [navigationController isNavigationBarHidden] ) {
//        UIApplication* app = [UIApplication sharedApplication];
//        if (app.statusBarHidden) {
//            app.statusBarHidden = NO;
//        }
//        [navigationController setNavigationBarHidden:NO animated:animated];
//        if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
//            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
//        }
//    }
}

#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
