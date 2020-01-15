//
//  AdheseError.h
//  Adhese SDK
//
//  Created by Axel Jonckheere on 15/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdheseErrorCode.h"

NS_ASSUME_NONNULL_BEGIN

@interface AdheseError : NSObject

@property (nonatomic, strong, nullable) NSString* message;
@property (nonatomic, assign) AdheseErrorCode errorCode;

-(id)initWithMessage:(NSString * _Nullable)message;
-(id)initWithErrorCode:(AdheseErrorCode)errorCode;
-(id)initWithErrorCode:(AdheseErrorCode)errorCode withMessage:(NSString * _Nullable)message;
-(id)initWithError:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
