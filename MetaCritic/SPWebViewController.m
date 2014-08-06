//
//  SPWebViewController.m
//  BlogReader
//
//  Created by Sam Piggott on 27/02/2014.
//  Copyright (c) 2014 Sam Piggott. All rights reserved.
//

#import "SPWebViewController.h"
#import "MBProgressHUD.h"

@interface SPWebViewController ()

@end

@implementation SPWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self.webView setDelegate:self];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSURL *url = [NSURL URLWithString:self.gameURL];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
    
    NSString *topbarString = [NSString stringWithFormat:@"%@", self.gameTitle];
    [self.topBar initWithTitle:topbarString];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    // From UIWebViewDelegate reference
    // - (What is returned)NameOfMethod:(Expected input)Instance Variable

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

@end
