//
//  BannersView.m
//  MFShow
//
//  Created by Meng Fan on 16/12/27.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "BannersView.h"
#import "UIViewAdditions.h"

@interface BannersView () <UIScrollViewDelegate>

//父控制器
@property (nonatomic, weak) UIViewController *parentViewController;

//数据源
@property (nonatomic, strong) NSArray *bannersList;

@end


@implementation BannersView

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        self.height = 2;
    }
    return self;
}

#pragma mark - set
#define context_width 320.0
/*
    {   key     value
        
        type :  zhuanti/web
        ad_width :  图片的宽度
        ad_height:  图片的高度
    }
 */
-(void)setBannersList:(NSArray *)bannersList {
    if (bannersList) {
        
        NSMutableArray* newData = [NSMutableArray arrayWithCapacity:[bannersList count]];
        //处理数据
        for (NSDictionary* itemDict in bannersList) {
            NSString* typeString = [itemDict objectForKey:@"type"];
            if ([typeString isEqualToString:@"zhuanti"] || [typeString isEqualToString:@"web"]) {
                [newData addObject:itemDict];
            }
        }
        bannersList = newData;
    }
    
    _bannersList = bannersList;
    
    //清空scrollView
    [self.scrollview removeAllSubviews];
    
    //取出数据，计算等比例图片高度，重置高度
    if (_bannersList && [_bannersList count] > 0) {
        //原来数据的第一条数据
        NSDictionary *parameter = [_bannersList objectAtIndex:0];
        
        NSNumber *picWidth = [parameter objectForKey:@"ad_width"];
        NSNumber *picHeight = [parameter objectForKey:@"ad_height"];
        NSInteger image_height = context_width * [picHeight floatValue] / [picWidth floatValue];
        self.height = image_height;
        
        //设置scrollView的内容视图
        self.scrollview.contentSize = CGSizeMake(([_bannersList count] + 2)*320, image_height);
        
        //设置scrollView
        for (NSInteger index = 0; index < ([_bannersList count] + 2); index++) {
            
            //设置循环滚动的下标
            NSInteger objIndex = index - 1;
            if (0 == index) {
                objIndex = [_bannersList count] - 1;
            }else if ([_bannersList count] + 1 == index) {
                objIndex = 0;
            }
            
            //拿到当前数据
            NSDictionary *parameterDict = [_bannersList objectAtIndex:objIndex];
//            UIImageView *imageView = [];
        }
    }
    
//    if (_bannersList && [_bannersList count] > 0) {
//        for (NSInteger index = 0; index < [_bannersList count]+2; index++) {
//            NSDictionary* parameterDict = [_bannersList objectAtIndex:objIndex];
//            UIImageView* imageView = [[SCGIFImageView alloc] initWithFrame:CGRectMake(index*320, 0, 320, self.height)];
//            [imageView setFunnyShowImageWithURL:[NSURL URLWithString:[parameterDict objectForKey:@"pic"]] placeholderImage:stretchableImage(@"image_default.png")];
//            [self.scrollview addSubview:imageView];
//        }
//        self.scrollview.contentOffset = CGPointMake(320, 0);
//        
//        self.pageContrl.numberOfPages = [_bannersList count];
//        self.pageContrl.currentPage = 0;
//        //        [self saveBufferDataToFile];
//    }
//    else {
//        self.height = 2;
//    }
//    [NSObject cancelPreviousPerformRequestsWithTarget:self];
//    [self performSelector:@selector(doneAnimation) withObject:nil afterDelay:BannersView_AnimateDuration];
//    
    
}


//-(instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//
//        self.backgroundColor = [UIColor redColor];
//
//    }
//    return self;
//}
//
//-(void)awakeFromNib {
//    [super awakeFromNib];
//    
//    self.backgroundColor = [UIColor redColor];
//}

@end
