//
//  APIManager.m
//  Adhese SDK
//
//  Created by Axel Jonckheere on 09/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import "APIManager.h"

@implementation APIManager

- (id)initWithbaseUrl:(NSString *)baseUrl {
    self = [super init];
    if (self) {
        self.baseUrl = baseUrl;
    }
    return self;
}

- (void)getForUrl:(NSString*)url withCompletionHandler:(APIResponseCompletionHandler)callback {
    NSString *fullUrl = self.baseUrl ? [NSString stringWithFormat:@"%@%@", self.baseUrl, url] : url;
    NSURL *requestUrl = [NSURL URLWithString:fullUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        AdheseAPIResponse *apiResponse = [[AdheseAPIResponse alloc] initWithData:data withError:error];
        callback(apiResponse);
    }];

    [task resume];
}

@end
