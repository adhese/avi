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

#pragma mark - Initialisation

- (void)viewDidLoad {
    [super viewDidLoad];
    
    events = [[NSMutableArray alloc] init];
    
    [self setDelegates];
    [self initView];
    [self loadAds];
}

- (void)initView {
    [self setTitle:@"Adhese SDK"];
    
    UIBarButtonItem *showEventsButton = [[UIBarButtonItem alloc] initWithTitle:@"Events" style:UIBarButtonItemStylePlain target:self action:@selector(showEvents:)];
    self.navigationItem.rightBarButtonItem = showEventsButton;
    
}

-(void)setDelegates {
    [self.billboardAdview setDelegate:self];
    [self.halfpageAdView setDelegate:self];
}

- (void)loadAds {
    // Build Adhese options
    AdheseOptions *options = [[AdheseOptions alloc] initWithLocation:@"_demo_ster_a_"];
    options.cookieMode = kAll;
    options.slots = @[@"billboard", @"halfpage"];
  
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
            [self.halfpageAdView setAd:halfPage];
        } else {
            [self.halfpageAdView setHidden:YES];
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
    [events addObject:[NSString stringWithFormat:@"%@ did load.", view.ad.slotName]];
}

-(void)viewImpressionWasNotified:(id)adView withError:(AdheseError * _Nullable)error {
    AdView *view = (AdView *) adView;
    [events addObject:[NSString stringWithFormat:@"%@ view impression was called.", view.ad.slotName]];
}

-(void)trackerWasNotified:(id)adView withError:(AdheseError * _Nullable)error {
    AdView *view = (AdView *) adView;
    [events addObject:[NSString stringWithFormat:@"%@'s tracker was called.", view.ad.slotName]];
}


@end
