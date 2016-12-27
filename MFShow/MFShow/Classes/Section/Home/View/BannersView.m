//
//  BannersView.m
//  MFShow
//
//  Created by Meng Fan on 16/12/27.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "BannersView.h"

@implementation BannersView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor redColor];

    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor redColor];
}

@end
