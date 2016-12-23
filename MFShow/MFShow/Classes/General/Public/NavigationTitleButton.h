//
//  NavigationTitleButton.h
//  MFShow
//
//  Created by Meng Fan on 16/12/23.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationTitleButton : UIView

/**
 *   导航栏按钮视图
 */


//设置按钮的选择数字，有多少个标签，设置多少个数字0表示最左边，最大的数字表示最右边
@property (nonatomic, assign) NSInteger selected;
@property (nonatomic, assign) BOOL enable;


@property (nonatomic, strong) NSString *leftText;
@property (nonatomic, strong) NSString *middleText;


@end
