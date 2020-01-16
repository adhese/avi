//
//  AdView.m
//  Adhese SDK
//
//  Created by Axel Jonckheere on 14/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import "AdView.h"
#import <WebKit/WKWebViewConfiguration.h>
#import "AdheseLogger.h"
#import "APIManager.h"

@implementation AdView

#pragma mark - Init

BOOL isContentLoaded;
BOOL hasViewImpressionBeenCalled;
BOOL isViewImpressionCallInProgress;
BOOL isViewCurrentlyVisible;

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
    _ad = ad;
    [self loadAd];
}

#pragma mark - Helpers

-(void)loadAd {
    [[NSOperationQueue mainQueue] addOperationWithBlock:^ {
        [self loadHTMLString:self.ad.content baseURL:nil];
    }];
}

-(void)notifyTracker {
    [AdheseLogger logEvent:SDK_EVENT withMessage:[NSString stringWithFormat:@"Will notify the tracker for slot %@", self.ad.slotName]];
    
    [[[APIManager alloc] initWithBaseUrl:nil] getForUrl:self.ad.trackerUrl withCompletionHandler:^(AdheseAPIResponse * _Nonnull response) {
        
        if (response.error) {
            [AdheseLogger logEvent:SDK_ERROR withMessage:[NSString stringWithFormat:@"Failed to notify the tracker for slot %@. %@", self.ad.slotName, response.error.description]];
            [self.delegate trackerWasNotified:self withError:response.error];
            return;
        }
        
        [AdheseLogger logEvent:SDK_EVENT withMessage:[NSString stringWithFormat:@"Notified tracker for slot  %@", self.ad.slotName]];
        
        [self.delegate trackerWasNotified:self withError:nil];
    }];
}

-(void)notifyViewImpression {
    isViewImpressionCallInProgress = YES;
    [AdheseLogger logEvent:SDK_EVENT withMessage:[NSString stringWithFormat:@"Will notify the view impression for slot %@", self.ad.slotName]];

    [[[APIManager alloc] initWithBaseUrl:nil] getForUrl:self.ad.trackerUrl withCompletionHandler:^(AdheseAPIResponse * _Nonnull response) {
        
        if (response.error) {
            [AdheseLogger logEvent:SDK_ERROR withMessage:[NSString stringWithFormat:@"Failed to send view impression for slot %@. %@", self.ad.slotName, response.error.description]];
            [self.delegate viewImpressionWasNotified:self withError:response.error];
            return;
        }
        
        [AdheseLogger logEvent:SDK_EVENT withMessage:[NSString stringWithFormat:@"Notified tracker for slot %@", self.ad.slotName]];
        
        [self.delegate viewImpressionWasNotified:self  withError:nil];
    }];
}

-(void)triggerViewImpressionWhenVisible {
    if (!hasViewImpressionBeenCalled
        && !isViewImpressionCallInProgress
        && self.ad
        && self.ad.viewableImpressionUrl
        && self.ad.viewableImpressionUrl.length > 0
        && !self.isHidden
        && isViewCurrentlyVisible) {
            [AdheseLogger logEvent:SDK_EVENT withMessage:[NSString stringWithFormat:@"%@ is visible", self.ad.slotName]];
            [self notifyViewImpression];
    }
}

#pragma mark - WKNavigationDelegate

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    if (isContentLoaded) {
        return;
    }
    
    isContentLoaded = YES;
    
    [self.delegate adDidLoad:self withError:nil];
    
    [AdheseLogger logEvent:SDK_EVENT withMessage:[NSString stringWithFormat:@"Finished loading slot %@", self.ad.slotName]];

    [self notifyTracker];
    [self triggerViewImpressionWhenVisible];
}

-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    
}

#pragma mark - Overrides

- (void)didMoveToWindow {
    [super didMoveToWindow];
    
    isViewCurrentlyVisible = self.window != nil;
}

@end
