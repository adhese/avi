//
//  AdheseAPIResponse.m
//  Adhese SDK
//
//  Created by Axel Jonckheere on 10/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import "AdheseAPIResponse.h"

@implementation AdheseAPIResponse


- (id)initWithData:(NSData *)data withError:(AdheseError * _Nullable)error {
    self = [super init];
    if (self) {
        self.data = data;
        self.error = error;
    }
    return self;
}

@end
