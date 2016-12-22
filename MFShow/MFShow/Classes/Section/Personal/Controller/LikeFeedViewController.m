//
//  LikeFeedViewController.m
//  MFShow
//
//  Created by Meng Fan on 16/12/22.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "LikeFeedViewController.h"

@interface LikeFeedViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LikeFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
//    self.navigationItem.rightBarButtonItem.enabled = (0 != [self.tableViewData count]);
//    self.showNoFavoriteLabel.hidden = (0 != [self.tableViewData count]);
//    return [self.tableViewData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSDictionary* itemDict = [self.tableViewData objectAtIndex:[indexPath row]];
    NSString *cellIdentifier = @"MainFeelCell";
//    if ([[itemDict objectForKey:kItemKind] integerValue]  == 0 || [[itemDict objectForKey:kItemKind] integerValue]  == 6) {
//        cellIdentifier = @"SubjectFeedCell";
//    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if ([cell respondsToSelector:@selector(setParameterDict:)]) {
//        [cell performSelector:@selector(setParameterDict:) withObject:itemDict];
//    }
//    if ([cell respondsToSelector:@selector(setParentViewCtrl:)]) {
//        [cell performSelector:@selector(setParentViewCtrl:) withObject:self];
//    }
    return cell;
}

#pragma mark - UITableViewDelegate



#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
