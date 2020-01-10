//
//  APIManager.h
//  Adhese SDK
//
//  Created by Axel Jonckheere on 09/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//typedef void (^VersionResponseCompletionHandler)(AppVersion *version);

@interface APIManager : NSObject

@property (nonatomic, strong) NSString* baseUrl;

- (id)initWithbaseUrl:(NSString *)baseUrl;
-(void)getForUrl:(NSString*)url; // TODO: add completionhandler

@end

NS_ASSUME_NONNULL_END
