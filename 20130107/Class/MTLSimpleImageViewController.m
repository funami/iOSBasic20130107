//
//  MTLSimpleImageViewController.m
//  20130107
//
//  Created by Takao Funami on 2013/01/07.
//  Copyright (c) 2013年 Takao Funami. All rights reserved.
//

#import "MTLSimpleImageViewController.h"

@interface MTLSimpleImageViewController ()

@end

@implementation MTLSimpleImageViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
