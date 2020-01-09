//
//  AdheseOptions.h
//  Adhese SDK
//
//  Created by Axel Jonckheere on 08/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Device.h"

NS_ASSUME_NONNULL_BEGIN

@interface AdheseOptions : NSObject

@property (nonatomic, strong) NSString* location;
@property (nonatomic, strong) NSArray<NSString *>* slots;
@property (nonatomic, strong) NSString* cookieMode;
@property (nonatomic, strong) Device* device;

@end

NS_ASSUME_NONNULL_END
