//
//  Ad.m
//  Adhese SDK
//
//  Created by Axel Jonckheere on 09/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import "Ad.h"
#import "JSONUtils.h"

@implementation Ad

-(id)initFromDictionary:(NSDictionary *)data {
    self = [super init];
    
    if (self) {
        
        if (![JSONUtils isTagNonExistentEmptyOrNil:data forKey:kTag]) {
            self.content = [data objectForKey:kTag];
        } else if (![JSONUtils isTagNonExistentEmptyOrNil:data forKey:kBody]) {
            self.content = [data objectForKey:kBody];
        } else {
            [NSException raise:@"Parsing error" format:@"The payload contains neither a tag or body property."];
        }
        
        if ([data objectForKey:kTracker]) {
            self.trackerUrl = [data objectForKey:kTracker];
        }
        
        if ([data objectForKey:kViewableImpressionUrl]) {
            self.viewableImpressionurl = [data objectForKey:kViewableImpressionUrl];
        }
        
        if ([data objectForKey:kAdType]) {
            self.adType = [data objectForKey:kAdType];
        }
        
        if ([data objectForKey:kSlotName]) {
            self.slotName = [data objectForKey:kSlotName];
        }
        
        if ([data objectForKey:kWidth]) {
            self.width = [[data objectForKey:kWidth] integerValue];
        }
        
        if ([data objectForKey:kHeight]) {
            self.height = [[data objectForKey:kHeight] integerValue];
        }
        
        self.raw = data;
    }
    
    return self;
}

@end
