//
//  AdheseError.m
//  Adhese SDK
//
//  Created by Axel Jonckheere on 15/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import "AdheseError.h"

@implementation AdheseError

#pragma mark - Init

-(id)initWithMessage:(NSString * _Nullable)message {
    return [self initWithErrorCode:kUnknown withMessage:message];
}

-(id)initWithErrorCode:(AdheseErrorCode)errorCode {
    return [self initWithErrorCode:errorCode withMessage:nil];
}

-(id)initWithErrorCode:(AdheseErrorCode)errorCode withMessage:(NSString * _Nullable)message {
    self = [super init];
    
    if (self) {
        self.errorCode = errorCode;
        self.message = message ? message : [self getDefaultErrorMessage];
    }
    
    return self;
}

-(id)initWithError:(NSError *)error {
    return [self initWithErrorCode:kUnknown withMessage:error.localizedDescription];
}

#pragma mark - Mappers

-(NSString *)getDefaultErrorMessage {
    switch (self.errorCode) {
        case kUnknown:
            return @"An unknown error occurred.";
        case kNetworkError:
            return @"Something went wrong performing the request.";
            break;
        case kParseError:
            return @"Could not parse the response received from the Adhese API.";
        default:
            return @"An unknown error occurred";
    }
}

-(AdheseErrorCode)convertError:(NSError *)error {
    switch (error.code) {
        default:
            return kUnknown;
    }
}

@end
