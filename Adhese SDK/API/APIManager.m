//
//  APIManager.m
//  Adhese SDK
//
//  Created by Axel Jonckheere on 09/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import "APIManager.h"
#import "AdheseLogger.h"

@implementation APIManager

- (id)initWithBaseUrl:(NSString * _Nullable)baseUrl {
    self = [super init];
    if (self) {
        self.baseUrl = baseUrl;
    }
    return self;
}

- (void)getForUrl:(NSString*)url withCompletionHandler:(APIResponseCompletionHandler)callback {
    NSString *fullUrl = @"https://ads-demo.adhese.com/json/sl_demo_ster_a_-billboard/sl_demo_ster_a_-halfpage/tlall/deAndroid/dtphone/brLGE_LG-H870"; //self.baseUrl ? [NSString stringWithFormat:@"%@%@", self.baseUrl, url] : url;
    NSURL *requestUrl = [NSURL URLWithString:fullUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl];

    [AdheseLogger logEvent:NETWORK_REQUEST withMessage:[NSString stringWithFormat:@"Performing GET for url %@", fullUrl]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            [AdheseLogger logEvent:SDK_ERROR withMessage:[NSString stringWithFormat:@"Error: %@", error.localizedDescription]];
            AdheseAPIResponse *apiResponse = [[AdheseAPIResponse alloc] initWithData:data withError:[[AdheseError alloc] initWithErrorCode:kNetworkError]];
            callback(apiResponse);
            return;
        }
        
        NSString *stringifiedResponse = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        [AdheseLogger logEvent:NETWORK_RESPONSE withMessage:[NSString stringWithFormat:@"Response %@", stringifiedResponse]];
        
        AdheseAPIResponse *apiResponse = [[AdheseAPIResponse alloc] initWithData:data withError:nil];
        callback(apiResponse);
    }];

    [task resume];
}

@end
