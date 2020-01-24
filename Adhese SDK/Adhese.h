//
//  Adhese.h
//  Adhese SDK
//
//  Created by Axel Jonckheere on 08/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ad.h"
#import "AdheseAPI.h"

NS_ASSUME_NONNULL_BEGIN

@interface Adhese : NSObject

+(void)initializeSdk:(NSString*)account withDebuggingEnabled:(bool)enabled;
+(void)initializeSdk:(NSString*)account;
+(NSString *)getAccount;
+(Device *)determineDevice;
+(void)loadAds:(AdheseOptions *)options withCompletionHandler:(AdsLoadedResponseHandler)callback;
+(NSString *)getHtmlWrapper;

@end

NS_ASSUME_NONNULL_END
