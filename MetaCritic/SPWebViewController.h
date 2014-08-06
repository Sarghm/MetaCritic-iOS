//
//  SPWebViewController.h
//  BlogReader
//
//  Created by Sam Piggott on 27/02/2014.
//  Copyright (c) 2014 Sam Piggott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPWebViewController : UIViewController

- (void)webViewDidFinishLoad:(UIWebView *)webView;

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString *releaseDate;
@property (strong, nonatomic) NSString *gameTitle;
@property (strong, nonatomic) NSString *gameScore;
@property (strong, nonatomic) NSString *gameURL;
@property (strong, nonatomic) NSString *gameImage;
@property (strong, nonatomic) IBOutlet UINavigationItem *topBar;

@property (strong, nonatomic) IBOutlet UIImageView *thumbImgView;


@end
