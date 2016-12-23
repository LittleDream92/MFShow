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

@interface HomeViewController () <NavigationTitleButtonDelegate>

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


#pragma mark - setUpViews
- (void)setUpNav {
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



#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
