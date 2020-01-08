//
//  Adhese.h
//  Adhese SDK
//
//  Created by Axel Jonckheere on 08/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Adhese : NSObject

+(void)initializeSdk:(NSString*)account withDebuggingEnabled:(bool)enabled;
+(void)initializeSdk:(NSString*)account;
+(NSString *)getAccount;
@end

NS_ASSUME_NONNULL_END
