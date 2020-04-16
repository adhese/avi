//
//  Ad.m
//  Adhese SDK
//
//  Created by Axel Jonckheere on 09/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import "Ad.h"
#import "JSONUtils.h"
#import "AdheseLogger.h"

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
        
        if ([data objectForKey:kTracker]) {
            self.trackerUrl = [data objectForKey:kTracker];
        } else {
            self.trackerUrl = nil;
            [AdheseLogger logEvent:SDK_EVENT withMessage:[NSString stringWithFormat:@"Ad with slot %@ loaded without a tracker url.", self.slotName]];
        }
        
        if ([data objectForKey:kViewableImpressionUrl]) {
            self.viewableImpressionUrl = [data objectForKey:kViewableImpressionUrl];
        } else {
            self.viewableImpressionUrl = nil;
            [AdheseLogger logEvent:SDK_EVENT withMessage:[NSString stringWithFormat:@"Ad with slot %@ loaded without a viewable impression url.", self.slotName]];
        }
        
        self.raw = data;
    }
    
    return self;
}

@end
