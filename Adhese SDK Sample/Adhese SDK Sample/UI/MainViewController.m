//
//  MainViewController.m
//  Adhese SDK Sample
//
//  Created by Axel Jonckheere on 10/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import "MainViewController.h"
#import <AdheseSDK/Adhese.h>
#import <AdheseSDK/CookieMode.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // TODO: init view
}

- (void)loadAds {
    // Build Adhese options
    AdheseOptions *options = [[AdheseOptions alloc] initWithLocation:@"_demo_ster_a_"];
    options.cookieMode = kAll;
    options.slots = @[@"billboard", @"halfpage"];
    
    [Adhese loadAds:options withCompletionHandler:^(NSArray<Ad *> * _Nonnull ads) {
        // TODO: do something with the ads...
        NSLog(@"%@", ads);
    }];
}

@end
