//
//  AdheseAPI.m
//  Adhese SDK
//
//  Created by Axel Jonckheere on 09/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import "AdheseAPI.h"
#import "AdheseLogger.h"

static NSString* BASE_URL = @"https://ads-%@.adhese.com/";

@implementation AdheseAPI

- (id)initWithAccount:(NSString *)account {
    self = [super init];
    
    self.apiManager = [[APIManager alloc] initWithbaseUrl:[NSString stringWithFormat:BASE_URL, account]];
    
    return self;
}

- (void)getAdsWithOptions:(AdheseOptions *)options withCompletionHandler:(AdsLoadedResponseHandler)completionHandler {
    NSString *url = [NSString stringWithFormat:@"json%@", [options getAsURL]];
    
    [self.apiManager getForUrl:url withCompletionHandler:^(AdheseAPIResponse * _Nonnull response) {
        NSDictionary* adsData = [self convertDataToDictionary:response.data];
        // TODO: convert response to Ad domain and call callback
    }];
}

-(NSDictionary*)convertDataToDictionary:(NSData *)data {
    NSError *error = nil;
    NSDictionary* jsonArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableLeaves error: &error];

    if (!jsonArray) {
        [AdheseLogger logEvent:SDK_ERROR withMessage:[NSString stringWithFormat:@"Error: %@", error.localizedDescription]];
    }

    return jsonArray;
}

@end
