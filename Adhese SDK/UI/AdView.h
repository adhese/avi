//
//  AdView.h
//  Adhese SDK
//
//  Created by Axel Jonckheere on 14/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <Webkit/WKWebView.h>
#import <Webkit/WKNavigationDelegate.h>
#import "Ad.h"
#import "AdheseError.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AdViewDelegate <NSObject>

@optional
- (void)adDidLoad:(id)adView withError:(AdheseError * _Nullable)error;

@optional
- (void)trackerWasNotified:(id)adView withError:(AdheseError * _Nullable)error;

@optional
- (void)viewImpressionWasNotified:(id)adView withError:(AdheseError * _Nullable)error;

@optional
- (void)adClicked:(id)adView withError:(AdheseError * _Nullable)error;

@end

@interface AdView : WKWebView <WKNavigationDelegate>

@property (nonatomic, strong) Ad* ad;
@property (nonatomic, weak) id <AdViewDelegate> delegate;
@property (nonatomic, assign) BOOL shouldOpenAd;


@end

NS_ASSUME_NONNULL_END
