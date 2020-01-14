//
//  APIManager.h
//  Adhese SDK
//
//  Created by Axel Jonckheere on 09/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdheseAPIResponse.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^APIResponseCompletionHandler)(AdheseAPIResponse *response);

@interface APIManager : NSObject

@property (nonatomic, strong) NSString* baseUrl;

- (id)initWithBaseUrl:(NSString * _Nullable)baseUrl;
- (void)getForUrl:(NSString*)url withCompletionHandler:(APIResponseCompletionHandler)callback;

@end

NS_ASSUME_NONNULL_END
