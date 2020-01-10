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

-(void)getForUrl:(NSString*)url {
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        // TODO: handle callback
    }];

    [task resume];
}

@end
