//
//  DownloadTableViewController.m
//  MFShow
//
//  Created by Meng Fan on 16/12/22.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "DownloadTableViewController.h"

@interface DownloadTableViewController ()

//控件
@property (weak, nonatomic) IBOutlet UIButton *download50Btn;
@property (weak, nonatomic) IBOutlet UIButton *download100Btn;
@property (weak, nonatomic) IBOutlet UILabel *downloadLabel;

@property (weak, nonatomic) IBOutlet UISwitch *indexSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *textSwitch;

@property (weak, nonatomic) IBOutlet UITableViewCell *downloadIndexCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *downloadTextCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *downloadLabelCell;


@end

@implementation DownloadTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - action
- (IBAction)onClick50:(id)sender {
    NSLog(@"click 50");
}


- (IBAction)onClick100:(id)sender {
    NSLog(@"click 100");
}

- (IBAction)onSwitchValueChanged:(id)sender {
    if ([self.indexSwitch isEqual:sender]) {
        NSLog(@"switch Index");
    } else if ([self.textSwitch isEqual:sender]) {
        NSLog(@"switch Text");
    }
}


@end
