//
//  AdheseLogger.h
//  Adhese SDK
//
//  Created by Axel Jonckheere on 08/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdheseLogger : NSObject

+(void)logMessage:(NSString*)message;
+(void)logEvent:(NSString*)event withMessage:(NSString*)message;
+(bool)isLoggingEnabled;
+(void)setIsLoggingEnabled:(bool)value;

@end

NS_ASSUME_NONNULL_END
