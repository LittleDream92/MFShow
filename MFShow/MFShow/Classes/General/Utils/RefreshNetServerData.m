//
//  RefreshNetServerData.m
//  MFShow
//
//  Created by Meng Fan on 16/12/23.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "RefreshNetServerData.h"


@interface RefreshNetServerData ()


//URL
@property (nonatomic, copy) NSString *httpUrlString;
//MD5加密的URL字符串
@property (nonatomic, copy) NSString *httpUrlStringMD5;


@end




@implementation RefreshNetServerData


#pragma mark -  自定义初始化方法
- (id)initWithUrlString:(NSString *)urlString {
    self = [super init];
    if (self) {
        //初始化
        self.httpUrlString = urlString;
        self.saveBufferData = YES;
        self.tableViewData = [NSMutableArray arrayWithCapacity:20];
        self.showTopNoticeToastLabel = YES;
        self.showRefreshHeaderView = YES;
        self.showReadPostion = NO;
        _itemMaxId = -1;
    }
    return self;
}

@end
