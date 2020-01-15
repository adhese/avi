//
//  AdheseAPI.h
//  Adhese SDK
//
//  Created by Axel Jonckheere on 09/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdheseOptions.h"
#import "APIManager.h"
#import "Ad.h"
#import "AdheseError.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^AdsLoadedResponseHandler)(NSArray<Ad *> *ads, AdheseError * _Nullable error);

@interface AdheseAPI : NSObject

@property (nonatomic, strong) APIManager* apiManager;

- (id)initWithAccount:(NSString *)account;
- (void)getAdsWithOptions:(AdheseOptions *)options withCompletionHandler:(AdsLoadedResponseHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
