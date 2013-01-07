//
//  MTLWebViewController.m
//  20130107
//
//  Created by Takao Funami on 2013/01/07.
//  Copyright (c) 2013年 Takao Funami. All rights reserved.
//

#import "MTLWebViewController.h"

@interface MTLWebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webVIew;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@end

@implementation MTLWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //日本語が入っているので、エスケープする必要がある
    NSString *escapedUrlString = [self.detailItem[@"url"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    [self.webVIew loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:escapedUrlString]]];
    self.title = self.detailItem[@"name"];
    self.indicator.hidden =YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma marl - webview delegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.indicator stopAnimating];
    self.indicator.hidden =YES;
    //[self updateToolbar];
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.indicator startAnimating];
    self.indicator.hidden =NO;
    //[self updateToolbar];
}
@end
