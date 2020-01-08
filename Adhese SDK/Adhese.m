//
//  Adhese.m
//  Adhese SDK
//
//  Created by Axel Jonckheere on 08/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import "Adhese.h"
#import "AdheseLogger.h"

@implementation Adhese

static bool isInitialized;

static NSString* adheseAccount;

+(void)initializeSdk:(NSString*)account withDebuggingEnabled:(bool)enabled {
    
    if (isInitialized) {
        [AdheseLogger logEvent:SDK_EVENT withMessage:@"Tried initialising the SDK but it was already initialised."];
        return;
    }
    
    if (!account || [account length] == 0) {
        [NSException raise:@"Illegal argument" format:@"The Adhese account must be a valid value."];
        return;
    }
    
    [AdheseLogger setIsLoggingEnabled:enabled];
    adheseAccount = account;

    [AdheseLogger logEvent:SDK_EVENT withMessage:@"Initialised the SDK."];
}

+(void)initializeSdk:(NSString*)account {
    [self initializeSdk:account withDebuggingEnabled:false];
}

+(NSString *)getAccount {
    return adheseAccount;
}

@end
