//
//  JSONUtils.m
//  Adhese SDK
//
//  Created by Axel Jonckheere on 13/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import "JSONUtils.h"

@implementation JSONUtils


+(BOOL)isTagNonExistentEmptyOrNil:(NSDictionary *)data forKey:(NSString *)key {
    return !data || ![data objectForKey:key] || [[data objectForKey:key] isEqual:@""];
}

@end
