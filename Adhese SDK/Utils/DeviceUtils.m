//
//  DeviceUtils.m
//  Adhese SDK
//
//  Created by Axel Jonckheere on 13/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import "DeviceUtils.h"
#import "DeviceType.h"

@implementation DeviceUtils

+(NSString *)determineDeviceType {
    return [[UIDevice currentDevice] userInterfaceIdiom]  == UIUserInterfaceIdiomPad ? kTablet : kPhone;
}


@end
