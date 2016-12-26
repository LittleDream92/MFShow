//
//  RefreshNetServerData.m
//  MFShow
//
//  Created by Meng Fan on 16/12/23.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "RefreshNetServerData.h"
#import "EGORefreshTableHeaderView.h"

@interface RefreshNetServerData ()


//URL
@property (nonatomic, copy) NSString *httpUrlString;
//MD5加密的URL字符串
@property (nonatomic, copy) NSString *httpUrlStringMD5;
//数据
@property (nonatomic, copy) NSMutableArray *requestData;

//刷新的头视图 (第三方EGORefreshTableHeaderView)
@property (nonatomic, strong) EGORefreshTableHeaderView *refreshHeaderView;

//是否有加载更多按钮
@property (nonatomic, assign) BOOL haveGetMoreDataButton;

@end




@implementation RefreshNetServerData


@synthesize itemMaxId = _itemMaxId;


//销毁
-(void)dealloc {
    if (self.tableView) {
        self.tableView.tableFooterView = nil;
    }
    
    
}

#pragma mark -  自定义初始化方法
- (id)initWithUrlString:(NSString *)urlString {
    self = [super init];
    if (self) {
        //初始化
        self.httpUrlString = urlString;
        self.saveBufferData = YES;
        self.requestData = [NSMutableArray arrayWithCapacity:20];
        self.tableViewData = [NSMutableArray arrayWithCapacity:20];
        self.showTopNoticeToastLabel = YES;
        self.showRefreshHeaderView = YES;
        self.showReadPostion = NO;
        _itemMaxId = -1;
    }
    return self;
}

#pragma mark - set and get
//更多数据需要的参数
-(NSInteger)itemMaxId {
    
    if (_itemMaxId < 0) {
        //从NSUserdefault中取出数据,存储的是字典——key:itemMaxId_dict，value:｛key:self.httpUrlStringMD5, value:_itemMaxId(number)｝
        NSDictionary *itemMaxId_dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"itemMaxId_dict"];
        _itemMaxId = [[itemMaxId_dict objectForKey:self.httpUrlStringMD5] getIntValue];
    }
    
    return _itemMaxId;
}

-(void)setItemMaxId:(NSInteger)itemMaxId {
    _itemMaxId = itemMaxId;
    
    //存储到NSUSerdefault中
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    //先取出上次存储的数据，然后拼接，最后替换存储.
    NSDictionary *itemMaxId_dict = [userDefault objectForKey:@"itemMaxId_dict"];
    NSMutableDictionary *mut_itemMaxId_dict = [NSMutableDictionary dictionaryWithDictionary:itemMaxId_dict];
    [mut_itemMaxId_dict setObject:[NSNumber numberWithInteger:_itemMaxId] forKey:self.httpUrlStringMD5];
    [userDefault setObject:mut_itemMaxId_dict forKey:@"itemMaxId_dict"];
}


#pragma mark - public
//类方法
+ (NSString *)getRefreshIdByURLString:(NSString *)urlString {
    
}
+ (NSString *)getBufferFileNameByUrlString:(NSString *)urlString {
    
}


//
- (UIBarButtonItem*)getRefreshBarButton {
    
}
- (NSDictionary*)getCurrResponseDict {
    
}

- (void)refreshNewData {
    
}
- (void)refreshMoreData {
    
}
- (BOOL)isRefreshing {
    
}


#pragma mark -scrollView Delegate

//加载更多：拉动高度设置
#define kLoadMoreTriggerHeight_ 4.0

//滑动视图结束拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView == self.tableView) {
        if (self.refreshHeaderView) {
            [self.refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
        }
        
        UIView *view = [self.tableView superview];
        float offset = scrollView.contentOffset.y + view.frame.size.height - scrollView.contentSize.height;
        
        if (offset >= kLoadMoreTriggerHeight_) {
            if (self.haveGetMoreDataButton && [self.tableViewData count] >= 10) {
                [self refreshMoreData];
            }
        }
        
        if (!decelerate) {
            [self recordOffsetPostion:scrollView];
        }
    }
}

//滑动视图结束减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        [self recordOffsetPostion:scrollView];
    }
}

//tableView滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView && self.showRefreshHeaderView) {
        [self.refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    }
}


#pragma mark - private
- (void)recordOffsetPostion:(UIScrollView *)scrollView {
    
}




@end
