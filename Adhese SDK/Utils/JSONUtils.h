//
//  JSONUtils.h
//  Adhese SDK
//
//  Created by Axel Jonckheere on 13/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSONUtils : NSObject

+(BOOL)isTagNonExistentEmptyOrNil:(NSDictionary *)data forKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
