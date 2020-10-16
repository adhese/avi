//
//  AdheseSDKTests.m
//  AdheseSDKTests
//
//  Created by Sander Bogaert on 16/10/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AdheseSDK/Adhese.h>

@interface AdheseSDKTests : XCTestCase

@end

@implementation AdheseSDKTests
AdheseOptions *options;

- (void)setUp {
    options = [[AdheseOptions alloc] initWithLocation:@"_test_loc"];
    options.slots = @[@"test_slot"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testBuildUrl {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    options.customParameters = @{
        @"xa" : @[@"abc"],
        @"xb" : @[@"abc", @"def"],
        @"xc" : @[@"ghi"]
    };
    NSString* url = options.getAsURL;
    XCTAssertEqualObjects(url, @"/sl_test_loc-test_slot/xaabc/xbabc;def/xcghi", @"Url not formed correctly.");

}

@end
