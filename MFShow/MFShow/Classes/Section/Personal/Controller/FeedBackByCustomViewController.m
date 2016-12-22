//
//  FeedBackByCustomViewController.m
//  MFShow
//
//  Created by Meng Fan on 16/12/22.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "FeedBackByCustomViewController.h"

@interface FeedBackByCustomViewController ()
<UITextViewDelegate, UITextFieldDelegate>

//控件
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UIView *inputView;

@property (weak, nonatomic) IBOutlet UIImageView *contentImageBG;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UILabel *contentplaceHolder;

@property (weak, nonatomic) IBOutlet UIImageView *contactImageBG;
@property (weak, nonatomic) IBOutlet UITextField *contactTextField;





@end

@implementation FeedBackByCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - action
- (IBAction)sendFeedBack:(id)sender {
    NSLog(@"send feed back");
}

#pragma mark - UITextViewDelegate

#pragma mark - UITextFieldDelegate


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
