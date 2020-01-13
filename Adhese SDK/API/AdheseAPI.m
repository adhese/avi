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
        NSArray* adsData = [self convertDataToDictionary:response.data];
        NSMutableArray<Ad *> * result = [NSMutableArray array];
        
        for (NSDictionary *entry in adsData) {
            Ad *ad = [[Ad alloc] initFromDictionary:entry];
            [result addObject:ad];
        }
        
        completionHandler([result copy]);
    }];
}

-(NSArray*)convertDataToDictionary:(NSData *)data {
    NSError *error = nil;
    NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableLeaves error:&error];

    if (!jsonArray) {
        [AdheseLogger logEvent:SDK_ERROR withMessage:[NSString stringWithFormat:@"Parsing error: %@", error.localizedDescription]];
    }

    return jsonArray;
}

@end
