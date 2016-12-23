//
//  NavigationTitleButton.h
//  MFShow
//
//  Created by Meng Fan on 16/12/23.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>


//代理方法
@class NavigationTitleButton;

@protocol NavigationTitleButtonDelegate <NSObject>

@optional
- (void)selectedNavigationItem:(NavigationTitleButton *)button withIndex:(NSNumber *)selectedIndex;

@end





@interface NavigationTitleButton : UIView

//代理
@property (nonatomic, assign) id<NavigationTitleButtonDelegate> delegate;

//设置按钮的选择数字，有多少个标签，设置多少个数字0表示最左边，最大的数字表示最右边
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, assign) BOOL enable;


@property (nonatomic, strong) NSString *leftText;
@property (nonatomic, strong) NSString *middleText;


@end
