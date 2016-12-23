//
//  NavigationTitleButton.m
//  MFShow
//
//  Created by Meng Fan on 16/12/23.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "NavigationTitleButton.h"


@interface NavigationTitleButton ()

//控件
@property (nonatomic, weak) IBOutlet UILabel *leftItemLabel;
@property (nonatomic, weak) IBOutlet UILabel *middleItemLabel;

@property (nonatomic, weak) IBOutlet UIView *leftLine;
@property (nonatomic, weak) IBOutlet UIView *middleLine;

//普通和选中颜色
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *selectColor;


//点击手势
@property (nonatomic, strong) UITapGestureRecognizer *tapImageGesture;

@end





@implementation NavigationTitleButton

@dynamic leftText;
@dynamic middleText;

 
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        self.enable = YES;
        
        //初始化点击手势
        UITapGestureRecognizer *single = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        single.numberOfTapsRequired = 1;
        single.numberOfTouchesRequired = 1;
        self.tapImageGesture = single;
        [self addGestureRecognizer:single];
        
        //初始化颜色
        self.selectColor = [UIColor colorFromHexRGB:@"333333"];
        self.normalColor = [UIColor colorFromHexRGB:@"ff9523"];
        [self performSelector:@selector(setColor) withObject:nil afterDelay:0.0];
        
    }
    return self;
}
 


#pragma mark - action
- (void)setColor {
    if (_leftItemLabel) {
        _leftItemLabel.textColor = self.normalColor;
    }
    if (_middleItemLabel) {
        _middleItemLabel.textColor = self.selectColor;
    }
}


- (void)handleTap:(UITapGestureRecognizer *)gesture {
    NSLog(@"tap");
    if (gesture.state == UIGestureRecognizerStateEnded && self.enable) {
        NSArray* arr = self.subviews;
        UILabel *templ = nil;
        NSInteger flag = 0;
        for (id lab in arr){
            if([lab isKindOfClass:[UILabel class]]){
                templ=lab;
                if ([templ pointInside:[gesture locationInView:templ] withEvent:nil]) {
                    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"kShowRandomBtn"]) {
                        if (templ.tag == 1002) {
                            return;
                        }
                    }
                    if (templ.tag == (self.selected + 1000)) {
                        return;
                    }
                    self.selected = templ.tag - 1000;
                    flag = 1;
                    break;
                }
            }
        }
        if (flag!=1) {
            return;
        }
        //代理方法传值
        if (self.delegate && [self.delegate respondsToSelector:@selector(selectedNavigationItem:withIndex:)])
        {
            [self.delegate performSelector:@selector(selectedNavigationItem:withIndex:) withObject:self withObject:[NSNumber numberWithInteger:self.selected]];
        }
    }
}
 

#pragma mark -
//选中之后设置颜色变化
- (void)setTextColor {
    NSArray *arr = self.subviews;
    
    UILabel *templ = nil;
    UIView *tempV;
    
    //改变label字体颜色
    for (id lab in arr) {
        if ([lab isKindOfClass:[UILabel class]]) {
            templ = lab;
            if (templ.tag == (self.selected + 1000)) {  //1000  最热
                templ.textColor = self.normalColor;
            }else {
                templ.textColor = self.selectColor;
            }
        }
    }
    
    //改变View颜色
    for (id view in arr) {
        if ([view isKindOfClass:[UIView class]]) {
            tempV = view;
            if (tempV.tag == (self.selected + 1200)) {      //leftView 1200
                tempV.backgroundColor = self.normalColor;
            }else{
                tempV.backgroundColor = [UIColor clearColor];
            }
        }
    }
}



#pragma mark - set and get
-(void)setLeftText:(NSString *)leftText {
    self.leftItemLabel.text = leftText;
}


-(void)setMiddleText:(NSString *)middleText {
    self.middleItemLabel.text = middleText;
}


-(NSString *)leftText {
    return self.leftItemLabel.text;
}

-(NSString *)middleText {
    return  self.middleItemLabel.text;
}


-(void)setSelected:(NSInteger)selected {
    _selected = selected;
    [self setTextColor];
}



@end
