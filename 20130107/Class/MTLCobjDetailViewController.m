//
//  MTLCobjDetailViewController.m
//  20130107
//
//  Created by Takao Funami on 2013/01/07.
//  Copyright (c) 2013年 Takao Funami. All rights reserved.
//

#import "MTLCobjDetailViewController.h"
#import "AFNetworking.h"

@interface MTLCobjDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;

@end

@implementation MTLCobjDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.mainImageView setImage:[UIImage imageNamed:self.detailItem[@"image"]]];
    self.title = self.detailItem[@"name"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
