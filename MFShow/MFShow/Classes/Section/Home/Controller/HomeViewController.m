//
//  HomeViewController.m
//  MFShow
//
//  Created by Meng Fan on 16/12/21.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "HomeViewController.h"
#import "NavigationTitleButton.h"

@interface HomeViewController () <NavigationTitleButtonDelegate>

//导航栏自定义控件
@property (weak, nonatomic) IBOutlet NavigationTitleButton *titleButton;



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
}

//初始化
- (void)setUpViews {
    
}


#pragma mark - NavigationTitleButtonDelegate
- (void)selectedNavigationItem:(NavigationTitleButton *)button withIndex:(NSInteger)selectedIndex {
    NSLog(@"selectIndex: %ld", selectedIndex);
}



#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
