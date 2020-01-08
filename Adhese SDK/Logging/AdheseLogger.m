//
//  AdheseLogger.m
//  Adhese SDK
//
//  Created by Axel Jonckheere on 08/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import "AdheseLogger.h"

@implementation AdheseLogger

static NSString* SDK_EVENT = @"SDK EVENT";
static NSString* SDK_ERROR = @"SDK ERROR";
static NSString* NETWORK_REQUEST = @"NETWORK - REQUEST";
static NSString* NETWORK_RESPONSE = @"NETWORK - RESPONSE";

static bool isLoggingEnabled;


+(void)logMessage:(NSString*)message {
    
    if (!isLoggingEnabled) {
        return;
    }
    
    if ([message containsString:SDK_ERROR]) {
        NSLog(@"❌ %@", message);
        return;
    }
    
    NSLog(@"ℹ️ %@", message);
}


+(void)logEvent:(NSString*)event withMessage:(NSString*)message {
    [self logMessage:[NSString stringWithFormat:@" %@ | %@", event, message]];
}

+(bool)isLoggingEnabled {
    return isLoggingEnabled;
}

+(void)setIsLoggingEnabled:(bool)value {
    isLoggingEnabled = value;
}


@end
