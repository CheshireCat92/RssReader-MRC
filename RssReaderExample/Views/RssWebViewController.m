//
//  RssWebViewController.m
//  RssReaderExample
//
//  Created by Артем Ковалев on 24.09.17.
//  Copyright © 2017 Artem Kovalev. All rights reserved.
//

#import "RssWebViewController.h"
#import "RssWebViewModel.h"
@interface RssWebViewController ()<UIWebViewDelegate>{
    
}
@property (nonatomic, retain) RssWebViewModel *model;
@property (nonatomic, retain) UIWebView *webView;
@end

@implementation RssWebViewController
@synthesize webView;

+(id)initWithModel:(RssWebViewModel *)webViewModel{
    return [[[RssWebViewController alloc]initWithModel:webViewModel]autorelease];
}

-(id)initWithModel:(RssWebViewModel *)webViewModel{
    self = [super init];
    if (self) {
        _model = webViewModel;
        webView = [[UIWebView alloc]init];
        webView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

- (void)viewWillLayoutSubviews{
    
    NSArray<NSLayoutConstraint*>* webViewHorizontallAlignment = [NSLayoutConstraint constraintsWithVisualFormat:@"|[wView]|"
                                                                                                        options:NSLayoutFormatAlignAllCenterX
                                                                                                        metrics:nil
                                                                                                          views:@{@"wView":webView}];
    NSArray<NSLayoutConstraint*>* webViewVerticalAlignment = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[wView]|"
                                                                                                     options:NSLayoutFormatAlignAllCenterX
                                                                                                     metrics:nil
                                                                                                       views:@{@"wView":webView}];
    [self.view addConstraints:webViewHorizontallAlignment];
    [self.view addConstraints:webViewVerticalAlignment];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationItem setTitle:self.model.postTitle];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:webView];
    
    webView.delegate = self;
    NSURL *postURL = self.model.postDescriptionURL;
    NSURLRequest *webViewReq = [[NSURLRequest alloc]initWithURL:postURL];
    [webView loadRequest:webViewReq];
    [webViewReq release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    [_model release];
    [webView release];
    [super dealloc];
}

#pragma mark - WebView Delegate
-(void)webViewDidStartLoad:(UIWebView *)webView{
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
