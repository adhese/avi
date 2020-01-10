//
//  AdheseAPI.h
//  Adhese SDK
//
//  Created by Axel Jonckheere on 09/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdheseOptions.h"
#import "APIManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface AdheseAPI : NSObject

@property (nonatomic, strong) APIManager* apiManager;


@end

NS_ASSUME_NONNULL_END
