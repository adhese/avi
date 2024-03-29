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

NSMutableArray<NSString *> *events;
AdView *halfPageAdview;

#pragma mark - Initialisation

- (void)viewDidLoad {
    [super viewDidLoad];
    
    events = [[NSMutableArray alloc] init];
    
    [self initView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
        
    halfPageAdview = [[AdView alloc] initWithFrame:self.halfPageContainerView.bounds];
    [self.halfPageContainerView addSubview:halfPageAdview];
    
    [self setDelegates];
    
    [self loadAds];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)initView {
    [self setTitle:@"Adhese SDK"];
    
    UIBarButtonItem *showEventsButton = [[UIBarButtonItem alloc] initWithTitle:@"Events" style:UIBarButtonItemStylePlain target:self action:@selector(showEvents:)];
    self.navigationItem.rightBarButtonItem = showEventsButton;
    
}

-(void)setDelegates {
    [self.billboardAdview setDelegate:self];
    [halfPageAdview setDelegate:self];
}

- (void)loadAds {
    // Build Adhese options
    AdheseOptions *options = [[AdheseOptions alloc] initWithLocation:@"_demo_ster_a_"];
    options.cookieMode = kAll;
    options.slots = @[@"billboard", @"halfpage"];
    
    self.billboardAdview.shouldOpenAd = NO; // This line is neccessary to handle custom click logic, see adClicked

    [Adhese loadAds:options withCompletionHandler:^(NSArray<Ad *> * _Nonnull ads, AdheseError * _Nullable error) {
        
        if (error) {
            NSLog(@"Failed loading ads with errors: %@", error.description);
            return;
        }
        
        Ad *billboard = [self findAd:ads byType:@"billboard"];
        Ad *halfPage = [self findAd:ads byType:@"halfpage"];

        if (billboard) {
            [self.billboardAdview setAd:billboard];
        } else {
            [self.billboardAdview setHidden:YES];
        }

        if (halfPage) {
            [halfPageAdview setAd:halfPage];
        } else {
            [halfPageAdview setHidden:YES];
        }
    }];
}

#pragma mark - UI Bar actions

- (IBAction)showEvents:(id)sender {
    // Create message string
    NSMutableString *message = [[NSMutableString alloc] init];
    for (NSString *event in events) {
        [message appendFormat:@"%@ \n", event];
    }
    
    if (message.length == 0) {
        [message appendString:@"None"];
    }
    
    // Show dialog
    UIAlertController* alert = [UIAlertController
          alertControllerWithTitle:@"Events"
          message:message
          preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* dismissAction = [UIAlertAction
          actionWithTitle:@"OK" style:UIAlertActionStyleDefault
         handler:^(UIAlertAction * action) {}];

    [alert addAction:dismissAction];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Helpers

- (Ad *)findAd:(NSArray<Ad *> *)ads byType:(NSString *)type {
    for (Ad *ad in ads) {
        if ([ad.adType isEqualToString:type]) {
            return ad;
        }
    }
    return nil;
}

#pragma mark - AdViewDelegate

-(void)adDidLoad:(id)adView withError:(AdheseError * _Nullable)error {
    AdView *view = (AdView *) adView;
    
    if (error) {
        [events addObject:[NSString stringWithFormat:@"%@ failed loading. Cause: %@", view.ad.slotName, error.message]];
        return;
    }
    
    [events addObject:[NSString stringWithFormat:@"%@ did load.", view.ad.slotName]];
}

// Example for custom click handling, see "Extra" in the README.md
- (void)adClicked:(AdView *)adView withURL:(NSURL *)url {
    NSLog(@"Ad clicked, navigating to: %@", url.absoluteString);
}

-(void)viewImpressionWasNotified:(id)adView withError:(AdheseError * _Nullable)error {
    AdView *view = (AdView *) adView;
    
    if (error) {
        [events addObject:[NSString stringWithFormat:@"%@ view impression failed calling. Cause: %@", view.ad.slotName, error.message]];
        return;
    }
    
    [events addObject:[NSString stringWithFormat:@"%@ view impression was called.", view.ad.slotName]];
}

-(void)trackerWasNotified:(id)adView withError:(AdheseError * _Nullable)error {
    AdView *view = (AdView *) adView;
    
    if (error) {
        [events addObject:[NSString stringWithFormat:@"%@ tracker failed calling. Cause: %@", view.ad.slotName, error.message]];
        return;
    }
    
    [events addObject:[NSString stringWithFormat:@"%@'s tracker was called.", view.ad.slotName]];
}

@end
