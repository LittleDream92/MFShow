//
//  HomeViewController.m
//  MFShow
//
//  Created by Meng Fan on 16/12/21.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "HomeViewController.h"
#import "NavigationTitleButton.h"
#import "MainFeedViewController.h"

@interface HomeViewController () <NavigationTitleButtonDelegate, UINavigationControllerDelegate>

//导航栏自定义控件
@property (weak, nonatomic) IBOutlet NavigationTitleButton *titleButton;

@property (nonatomic, strong) MainFeedViewController *mainFeedViewController;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNav];
    [self setUpViews];
}

#pragma mark - systemViewMethods
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        if (self.navigationController.navigationBar) {
            self.navigationController.navigationBar.translucent = NO;
        }
        self.view.clipsToBounds = NO;
    }

}


#pragma mark - setUpViews
- (void)setUpNav {
    self.navigationController.delegate = self;
    
    //设置导航栏代理
    self.titleButton.delegate = self;
    //初始化选中下标
    self.titleButton.selectedIndex = 0;
}

//初始化
- (void)setUpViews {
    
    //初始化子控制器
    self.mainFeedViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainFeedViewController"];
    self.mainFeedViewController.view.frame = self.view.bounds;
    [self addChildViewController:self.mainFeedViewController];
    [self.view addSubview:self.mainFeedViewController.view];
}


#pragma mark - NavigationTitleButtonDelegate
- (void)selectedNavigationItem:(NavigationTitleButton *)button withIndex:(NSNumber *)selectedIndex {
    NSLog(@"selectIndex: %ld", [selectedIndex integerValue]);
}


#pragma mark - UINavigationControllerDelegate
-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (viewController ==  self) {
        UIApplication* app = [UIApplication sharedApplication];
        if (app.statusBarHidden) {
            app.statusBarHidden = NO;
        }
        if (navigationController.navigationBar.hidden) {
            navigationController.navigationBarHidden = NO;
        }
        if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
            [navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
            navigationController.navigationBar.translucent = NO;
            navigationController.navigationBar.barTintColor = [UIColor whiteColor];
            navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
//            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        }
        else {
//            [navigationController.navigationBar setBackgroundImage:stretchableImage(@"navigation_tab_2_p") forBarMetrics:UIBarMetricsDefault];
        }
    }
    
    else {
        UIApplication* app = [UIApplication sharedApplication];
        if (app.statusBarHidden) {
            app.statusBarHidden = NO;
        }
        if (navigationController.navigationBar.hidden) {
            navigationController.navigationBarHidden = NO;
        }
        //        if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        //            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        //        }
        //        [navigationController.navigationBar setBackgroundImage:stretchableImage(@"navigationbar_bg_white_6.png") forBarMetrics:UIBarMetricsDefault];
        [navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        navigationController.navigationBar.translucent = NO;
        navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
 //       [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }
    
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
