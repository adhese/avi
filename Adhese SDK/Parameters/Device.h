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

@interface Device : NSObject <URLParameter>

@property (nonatomic, strong) NSString* info;
@property (nonatomic, strong) NSString* brand;
@property (nonatomic, strong) NSString* type;


@end

NS_ASSUME_NONNULL_END
