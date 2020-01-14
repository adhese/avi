//
//  Device.h
//  Adhese SDK
//
//  Created by Axel Jonckheere on 08/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLParameter.h"

NS_ASSUME_NONNULL_BEGIN

@interface Device : NSObject

@property (nonatomic, strong, nullable) NSString* info;
@property (nonatomic, strong) NSString* brand;
@property (nonatomic, strong) NSString* type;

- (id)initWithDeviceBrand:(NSString *)deviceBrand deviceType:(NSString *)deviceType deviceInfo:(NSString * _Nullable)deviceInfo;
- (id)initWithDeviceBrand:(NSString *)deviceBrand deviceType:(NSString *)deviceType;
- (NSString *)getAsURL;

@end

NS_ASSUME_NONNULL_END
