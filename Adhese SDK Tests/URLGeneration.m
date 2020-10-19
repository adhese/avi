//
//  Adhese_SDK_Tests.m
//  Adhese SDK Tests
//
//  Created by Paul Janssens on 16/10/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Adhese.h"
#import "AdheseOptions.h"
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
    options.customParameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:
        [NSSet setWithObject:@"abc"], @"xa",
        [NSSet setWithObjects:@"abc", @"def", nil], @"xb",
        [NSSet setWithObject:@"ghi"], @"xc",
                                nil];
    NSString* url = options.getAsURL;
    
    XCTAssertEqualObjects(url, @"/sl_test_loc-test_slot/xaabc/xbabc;def/xcghi/tlall");
}

- (void) testUrlCustomParameter {
    AdheseOptions *options = [self prepareOptions];
    [options addCustomParameterRawWithKey:@"xa" andValue:@"abc"];
    
    NSString* url = options.getAsURL;
    
    XCTAssertEqualObjects(url, @"/sl_test_loc-test_slot/xaabc/tlall");
}

- (void) testUrlCustomParameter2 {
    AdheseOptions *options = [self prepareOptions];
    [options addCustomParameterRawWithKey:@"xa" andValue:@"abc"];
    [options addCustomParameterRawWithKey:@"xa" andValue:@"def"];
    [options addCustomParameterRawWithKey:@"xa" andValue:@"abc"];

    NSString* url = options.getAsURL;
    
    XCTAssertEqualObjects(url, @"/sl_test_loc-test_slot/xaabc;def/tlall");
}

- (void) testUrlCustomParameter3 {
    AdheseOptions *options = [self prepareOptions];

    [options addCustomParameterRawWithKey:@"xa" andValues:[NSSet setWithObjects:@"abc",@"def",nil]];
    [options addCustomParameterRawWithKey:@"xb" andValue:@"pqr"];

    NSString* url = options.getAsURL;
    
    XCTAssertEqualObjects(url, @"/sl_test_loc-test_slot/xaabc;def/xbpqr/tlall");
}

- (void) testUrlCustomParameter4 {
    AdheseOptions *options = [self prepareOptions];

    [options addCustomParameterRawWithKey:@"xa" andValues:[NSSet setWithObjects:@"abc",@"def",nil]];
    [options addCustomParameterRawWithKey:@"xb" andValue:@"pqr"];
    [options addCustomParametersRaw: @{
        @"xa" : [NSSet setWithObject:@"ghi"],
        @"xb" : [NSSet setWithObject:@"abc"],
        @"xc" : [NSSet setWithObject:@"ghi"]}];

    NSString* url = options.getAsURL;
    
    XCTAssertEqualObjects(url, @"/sl_test_loc-test_slot/xaabc;def;ghi/xbpqr;abc/xcghi/tlall");
}

- (void) testUrlCustomParameter5 {
    AdheseOptions *options = [self prepareOptions];

    [options addCustomParameterRawWithKey:@"xa" andValues:[NSSet setWithObjects:@"abc",@"def",nil]];
    [options addCustomParameterRawWithKey:@"xb" andValue:@"pqr"];
    [options removeCustomParameterForKey:@"xa"];

    NSString* url = options.getAsURL;
    
    XCTAssertEqualObjects(url, @"/sl_test_loc-test_slot/xbpqr/tlall");
}

- (void) testUrlCustomParameter6 {
    AdheseOptions *options = [self prepareOptions];

    [options addCustomParameterRawWithKey:@"xa" andValues:[NSSet setWithObjects:@"abc",@"def",nil]];
    [options addCustomParameterRawWithKey:@"xb" andValue:@"pqr"];
    [options removeCustomParameters];

    NSString* url = options.getAsURL;
    
    XCTAssertEqualObjects(url, @"/sl_test_loc-test_slot/tlall");
}


@end
