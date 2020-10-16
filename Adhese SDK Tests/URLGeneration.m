//
//  Adhese_SDK_Tests.m
//  Adhese SDK Tests
//
//  Created by Paul Janssens on 16/10/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Adhese.h"
#import "CookieMode.h"

@interface URLGeneration : XCTestCase

@end

@implementation URLGeneration


- (void) setUp {
}

- (void) tearDown {
}

- (AdheseOptions *) prepareOptions {
    AdheseOptions *options = [[AdheseOptions alloc] initWithLocation:@"_test_loc"];
    options.slots = @[@"test_slot"];
    options.cookieMode = kAll;
    return options;
}

- (void) testBaseUrl {
    AdheseOptions *options = [self prepareOptions];
    NSString* url = options.getAsURL;
    XCTAssertEqualObjects(url, @"/sl_test_loc-test_slot/tlall");
}

- (void) testUrl {
    AdheseOptions *options = [self prepareOptions];
    options.customParameters = @{
        @"xa" : @[@"abc"],
        @"xb" : @[@"abc", @"def"],
        @"xc" : @[@"ghi"]
    };
    NSString* url = options.getAsURL;
    
    XCTAssertEqualObjects(url, @"/sl_test_loc-test_slot/xaabc/xbabc;def/xcghi/tlall");
}


@end
