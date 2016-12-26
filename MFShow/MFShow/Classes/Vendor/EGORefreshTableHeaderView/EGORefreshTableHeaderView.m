//
//  EGORefreshTableHeaderView.m
//  Demo
//
//  Created by Devin Doty on 10/14/09October14.
//  Copyright 2009 enormego. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "EGORefreshTableHeaderView.h"
#import "CommonHelper.h"

#define TEXT_COLOR [UIColor colorWithRed:117.0/255.0 green:117.0/255.0 blue:117.0/255.0 alpha:1.0]
#define kEGORefreshTableHeaderView_BGColor [UIColor clearColor]
#define FLIP_ANIMATION_DURATION 0.18f

#define kEGORefreshTableView_LastRefresh @"kEGORefreshTableView_LastRefresh"


@interface EGORefreshTableHeaderView ()

@property (nonatomic, retain) NSString *ctrlClassName;
@property (nonatomic, assign) UITableView *tableView;

@end

@implementation EGORefreshTableHeaderView

@synthesize delegate=_delegate;
@synthesize ctrlClassName=_ctrlClassName;
@synthesize tableView=_tableView;

/**
 * @description: 初始化拉下刷新控件
 * @params: ctrlClassName - 对应ViewController的类名，用于作为存储最后更新时间的key
 */
- (EGORefreshTableHeaderView*)initAndAddtoTableView:(UITableView*)tableView
                                      ctrlClassName:(NSString*)ctrlClassName
{
    self = [self initWithFrame:CGRectMake(0.0f, 0.0f - tableView.bounds.size.height,
                                          [UIScreen mainScreen].bounds.size.width,
                                          tableView.bounds.size.height)];
    [tableView addSubview:self];
    
    self.tableView = tableView;
    self.ctrlClassName = ctrlClassName;
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		self.backgroundColor = kEGORefreshTableHeaderView_BGColor;

		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 30.0f, self.frame.size.width, 20.0f)];
		label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		label.font = [UIFont systemFontOfSize:12.0f];
		label.textColor = TEXT_COLOR;
		label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
		label.shadowOffset = CGSizeMake(0.0f, 1.0f);
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentCenter;
		[self addSubview:label];
		_lastUpdatedLabel=label;
		[label release];
		
		label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 48.0f, self.frame.size.width, 20.0f)];
		label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		label.font = [UIFont boldSystemFontOfSize:13.0f];
		label.textColor = TEXT_COLOR;
		label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
		label.shadowOffset = CGSizeMake(0.0f, 1.0f);
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentCenter;
		[self addSubview:label];
		_statusLabel=label;
		[label release];
		
		CALayer *layer = [CALayer layer];
		layer.frame = CGRectMake(25.0f, frame.size.height - 65.0f, 30.0f, 55.0f);
		layer.contentsGravity = kCAGravityResizeAspect;
		layer.contents = (id)[UIImage imageNamed:@"grayArrow.png"].CGImage;
		
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
		if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
			layer.contentsScale = [[UIScreen mainScreen] scale];
		}
#endif
		
		[[self layer] addSublayer:layer];
		_arrowImage=layer;
        _arrowImage.hidden = YES;
		
        [[self layer] addSublayer:layer];
		_arrowImage=layer;
        _arrowImage.hidden = YES;
		
		UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        CGRect activityFrame = view.frame;
        activityFrame.origin = CGPointMake(_arrowImage.frame.origin.x + _arrowImage.frame.size.width/2.0 - activityFrame.size.width/2.0 + 8.0, _statusLabel.frame.origin.y + _statusLabel.frame.size.height/2.0 - activityFrame.size.height/2.0);
        view.frame = activityFrame;
        
		[self addSubview:view];
		_activityView = view;
		[view release];
        
		[self setState:EGOOPullRefreshNormal];
    }
	
    return self;	
}

#pragma mark -
#pragma mark Setters
- (void)refreshLastUpdatedDate
{
    [self refreshLastUpdatedDate:nil];
}

- (void)refreshLastUpdatedDate:(NSDate*)date
{
    NSString *key = [NSString stringWithFormat:@"%@_%@", kEGORefreshTableView_LastRefresh, _ctrlClassName];
    
    if (date)
    {
        NSString *dateString = _MakeStrByDate(date);
        _lastUpdatedLabel.text = [NSString stringWithFormat:@"最后更新: %@", dateString];
        
        [[NSUserDefaults standardUserDefaults] setObject:_lastUpdatedLabel.text forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else
    {
        NSString *lastUpdateString = [[NSUserDefaults standardUserDefaults] objectForKey:key];        
        if (lastUpdateString)
        {
            _lastUpdatedLabel.text = [NSString stringWithFormat:@"%@", lastUpdateString];            
        }
        else
        {
            _lastUpdatedLabel.text = @"从未刷新";
        }
    }
}

- (void)setState:(EGOPullRefreshState)aState{
    
	switch (aState)
    {
		case EGOOPullRefreshPulling:
			
			_statusLabel.text = NSLocalizedString(@"松开即可刷新", @"Release to refresh status");
			[CATransaction begin];
			[CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
//			_arrowImage.transform = CATransform3DMakeRotation((M_PI / 180.0) * 180.0f, 0.0f, 0.0f, 1.0f);
			[CATransaction commit];
			
			break;
		case EGOOPullRefreshNormal:
			
			if (_state == EGOOPullRefreshPulling)
            {
				[CATransaction begin];
				[CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
//				_arrowImage.transform = CATransform3DIdentity;
				[CATransaction commit];
			}
			
			_statusLabel.text = NSLocalizedString(@"下拉可以刷新...", @"Pull down to refresh status");
//			[_activityView stopAnimating];
			[CATransaction begin];
			[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions]; 
//			_arrowImage.hidden = NO;
//			_arrowImage.transform = CATransform3DIdentity;
			[CATransaction commit];
			
			break;
		case EGOOPullRefreshLoading:
			
			_statusLabel.text = NSLocalizedString(@"加载中...", @"Loading Status");
//			[_activityView startAnimating];
			[CATransaction begin];
			[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions]; 
//			_arrowImage.hidden = YES;
			[CATransaction commit];
			
            [self showTopMarginWithAnimated: YES];
            
			break;
		default:
			break;
	}
	
	_state = aState;
}

#pragma mark -
#pragma mark 

- (void)egoRefreshScrollViewDidScroll:(UIScrollView *)scrollView
{
	if (_state == EGOOPullRefreshLoading)
    {        
         // Set tableview top margin
		CGFloat offset = MAX(scrollView.contentOffset.y * -1, 0);
		offset = MIN(offset, 60);
		scrollView.contentInset = UIEdgeInsetsMake(offset, 0.0f, 0.0f, 0.0f);
		
	} else if (scrollView.isDragging)
    {		
		BOOL _loading = NO;
		if ([_delegate respondsToSelector:@selector(egoRefreshTableHeaderDataSourceIsLoading:)]) {
			_loading = [_delegate egoRefreshTableHeaderDataSourceIsLoading:self];
		}
		
		if (_state == EGOOPullRefreshPulling && scrollView.contentOffset.y > -65.0f && scrollView.contentOffset.y < 0.0f && !_loading) {
			[self setState:EGOOPullRefreshNormal];
		} else if (_state == EGOOPullRefreshNormal && scrollView.contentOffset.y < -65.0f && !_loading) {
			[self setState:EGOOPullRefreshPulling];
		}
		
		if (scrollView.contentInset.top != 0)
        {
			scrollView.contentInset = UIEdgeInsetsZero;
		}
	}	
}

// 露出状态
- (void)showTopMarginWithAnimated:(BOOL)animated
{
    float height = 60.0;
    
    if (_tableView.contentOffset.y > -height)
        [_tableView setContentOffset:CGPointMake(0, -height) animated:NO];
    
    if (animated)
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:kEGORefreshTableHeaderViewDuration];
    }    

    _tableView.contentInset = UIEdgeInsetsMake(height, 0.0f, 0.0f, 0.0f);
    
    if (animated)
        [UIView commitAnimations];
}

- (void)egoRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView
{
	BOOL _loading = NO;
	if ([_delegate respondsToSelector:@selector(egoRefreshTableHeaderDataSourceIsLoading:)])
    {
		_loading = [_delegate egoRefreshTableHeaderDataSourceIsLoading:self];
	}
	
	if (scrollView.contentOffset.y <= - 65.0f && !_loading)
    {		
		if ([_delegate respondsToSelector:@selector(egoRefreshTableHeaderDidTriggerRefresh:)])
        {
			[_delegate egoRefreshTableHeaderDidTriggerRefresh:self];
		}
		
        // Set tableview top margin
		[self setState:EGOOPullRefreshLoading];
	}
}

- (void)egoRefreshScrollViewDataSourceDidFinishedLoadingWithSuccess:(NSNumber*)success
{
    if (!self.superview) {
        return;
    }
    [UIView animateWithDuration:kEGORefreshTableHeaderViewDuration_back animations:^{
        [_tableView setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
    }completion:^(BOOL finished) {
        if (_delegate && [_delegate respondsToSelector:@selector(egoRefreshTableHeaderDidEndLoadingAnimation:)])
        {
            [_delegate egoRefreshTableHeaderDidEndLoadingAnimation:self];
        }
    }];
		
	[self setState:EGOOPullRefreshNormal];

    if ([success boolValue])
    {
        [self refreshLastUpdatedDate:[NSDate date]];
    }
}

#pragma mark -
#pragma mark Dealloc
- (void)dealloc
{
    self.tableView = nil;
	_delegate=nil;
	_activityView = nil;
	_statusLabel = nil;
	_arrowImage = nil;
	_lastUpdatedLabel = nil;
    self.ctrlClassName = nil;
    [super dealloc];
}

@end






