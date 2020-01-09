//
//  Ad.h
//  Adhese SDK
//
//  Created by Axel Jonckheere on 09/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static NSString* kAdType = @"adType";
static NSString* kSlotName = @"slotName";
static NSString* kTag = @"tag";
static NSString* kBody = @"body";
static NSString* kTracker = @"tracker";
static NSString* kViewableImpressionUrl = @"viewableImpressionCounter";
static NSString* kWidth = @"width";
static NSString* kHeight = @"height";

@interface Ad : NSObject

@property (nonatomic, strong) NSString* content;
@property (nonatomic, strong) NSString* viewableImpressionurl;
@property (nonatomic, strong) NSString* trackerUrl;
@property (nonatomic, strong) NSString* adType;
@property (nonatomic, strong) NSString* slotName;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, assign) NSInteger height;

@end

NS_ASSUME_NONNULL_END
