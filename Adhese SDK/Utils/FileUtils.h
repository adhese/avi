//
//  FileUtils.h
//  Adhese SDK
//
//  Created by Axel Jonckheere on 28/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileUtils : NSObject

+(NSString *)loadSDKFileWithName:(NSString *)filename;
+(NSString *)loadSDKFileWithName:(NSString *)filename forPath:(NSString *)path;
+(BOOL)doesDirectoryExist:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
