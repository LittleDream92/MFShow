//
//  RefreshNetServerData.h
//  MFShow
//
//  Created by Meng Fan on 16/12/23.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

//处理数据的类

#import <Foundation/Foundation.h>


extern NSString *kRefreshDataOnRequestCompletedNotification;
extern NSString *kRefreshDataOnRequestCompletedSuccess;




//代理协议
@class RefreshNetServerData;

@protocol RefreshNetServerDataDelegate <NSObject>

@optional
- (void)refreshNewDataCompleted:(RefreshNetServerData *)refreshNetData;
- (NSString *)getURLString:(BOOL)isGetMoreData withPerPageCount:(NSInteger)pageCount;

@end






@interface RefreshNetServerData : NSObject

//代理
@property (nonatomic, weak) id<RefreshNetServerDataDelegate> delegate;

//表视图
@property (nonatomic, weak) UITableView *tableView;

//表视图数据源
@property (nonatomic, strong) NSMutableArray *tableViewData;

//无数据时的文字
@property (nonatomic, copy) NSString *messageStringWhenNoData;

//页数——获取更多数据时，协议里需要的数据
@property (nonatomic, assign) NSInteger itemMaxId;

//是否显示上次读到这里
@property (nonatomic, assign) BOOL showReadPostion;

//
@property (nonatomic, assign) BOOL saveBufferData;

//
@property (nonatomic, assign) BOOL showTopNoticeToastLabel;

//是否显示刷新头视图
@property (nonatomic, assign) BOOL showRefreshHeaderView;



//自定义初始化方法
- (id)initWithUrlString:(NSString *)urlString;

//类方法
+ (NSString *)getRefreshIdByURLString:(NSString *)urlString;
+ (NSString *)getBufferFileNameByUrlString:(NSString *)urlString;


//
- (UIBarButtonItem*)getRefreshBarButton;
- (NSDictionary*)getCurrResponseDict;

- (void)refreshNewData;
- (void)refreshMoreData;
- (BOOL)isRefreshing;

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

//-(NSString *)httpUrlStringMD5;
- (NSString *)httpUrlStringMd5;

@end
