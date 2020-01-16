//
//  AdheseAPIResponse.h
//  Adhese SDK
//
//  Created by Axel Jonckheere on 10/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdheseError.h"

NS_ASSUME_NONNULL_BEGIN

@interface AdheseAPIResponse : NSObject

@property (nonatomic, strong) NSData* data;
@property (nonatomic, strong, nullable) AdheseError* error;

- (id)initWithData:(NSData *)data withError:(AdheseError * _Nullable)error;

@end

NS_ASSUME_NONNULL_END
