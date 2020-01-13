//
//  Device.m
//  Adhese SDK
//
//  Created by Axel Jonckheere on 08/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import "Device.h"
#import "AdheseParameter.h"

@implementation Device

- (id)initWithDeviceBrand:(NSString *)deviceBrand deviceType:(NSString *)deviceType {
    return [self initWithDeviceBrand:deviceBrand deviceType:deviceType deviceInfo:nil];
}

- (id)initWithDeviceBrand:(NSString *)deviceBrand deviceType:(NSString *)deviceType deviceInfo:(NSString * _Nullable)deviceInfo {
    self = [super init];
    if (self) {
        self.brand = deviceBrand;
        self.type = deviceType;
        self.info = deviceInfo;
    }
    return self;
}

- (NSString *)getAsURL {
    NSMutableString *result = [[NSMutableString alloc] initWithString:@""];    
    
    if (self.info && [self.info length] != 0) {
        [result appendFormat:@"/%@%@", kDeviceId, self.info];
    }
    
    if (self.type && [self.type length] != 0) {
        [result appendFormat:@"/%@%@", kDeviceType, self.type];
    }
    
    if (self.brand && [self.brand length] != 0) {
        [result appendFormat:@"/%@%@", kDeviceBrand, self.brand];
    }
    
    return [[NSString alloc] initWithString:result];
}

@end
