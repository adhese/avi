//
//  AdheseOptions.m
//  Adhese SDK
//
//  Created by Axel Jonckheere on 08/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import "AdheseOptions.h"
#import "AdheseParameter.h"

@implementation AdheseOptions

- (id)initWithLocation:(NSString *)location {
    self = [super init];
    if (self) {
        self.location = location;
    }
    return self;
}

- (NSString *)getAsURL {
    NSMutableString *result = [[NSMutableString alloc] initWithString:@""];
    
    for (NSString* slot in self.slots) {
        [result appendFormat:@"/%@%@-%@", kSlot, self.location, slot];
    }
    
    NSArray<NSString *> *sortedKeys = [[self.customParameters allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    for (NSString *key in sortedKeys) {
        NSArray<NSString *>* values = self.customParameters[key];
        NSMutableString *valueString = [NSMutableString alloc];

        BOOL first = YES;
        for (NSString* value in values) {
            if (first) {
                valueString = [valueString initWithString: value];
                first = NO;
            } else {
                [valueString appendFormat:@";%@", value];
            }
        }
        [result appendFormat:@"/%@%@", key, valueString];
    }

    
    [result appendFormat:@"/%@%@", kCookieMode, self.cookieMode];
    
    if (self.device) {
        [result appendFormat:@"%@", [self.device getAsURL]];
    }
    
    return [[NSString alloc] initWithString:result];
}


@end
