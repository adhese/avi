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

NS_ASSUME_NONNULL_BEGIN

@interface AdView : WKWebView <WKNavigationDelegate>

@property (nonatomic, strong) Ad* ad;

@end

NS_ASSUME_NONNULL_END
