//
//  AdView.m
//  Adhese SDK
//
//  Created by Axel Jonckheere on 14/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import "AdView.h"
#import <WebKit/WKWebViewConfiguration.h>

@implementation AdView

#pragma mark - Init

-(instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithFrame:CGRectZero configuration:[[WKWebViewConfiguration alloc] init]];
    
    if (self) {
        [self bootstrap];
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame configuration:[[WKWebViewConfiguration alloc] init]];
    
    if (self) {
        [self bootstrap];
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration *)configuration {
    self = [super initWithFrame:frame configuration:configuration];
    
    if (self) {
        [self bootstrap];
    }
    
    return self;
}

-(void)bootstrap {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.navigationDelegate = self;
}

#pragma mark - Getters/Setters

-(void)setAd:(Ad *)ad {
    self.ad = ad;
    [self loadAd];
}

#pragma mark - Helpers

-(void)loadAd {
    [self loadHTMLString:self.ad.content baseURL:nil];
}

#pragma mark - WKNavigationDelegate

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
}

@end
