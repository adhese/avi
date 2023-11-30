//
//  FileUtils.m
//  Adhese SDK
//
//  Created by Axel Jonckheere on 28/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import "FileUtils.h"

@implementation FileUtils

+(NSString *)loadSDKFileWithName:(NSString *)filename {
    NSString *localResDir = [NSString stringWithFormat:@"%@/Frameworks/AdheseSDK.framework", [[NSBundle mainBundle] resourcePath]];
    NSString *cocoaPodResDir = [NSString stringWithFormat:@"%@/Frameworks/Adhese.framework", [[NSBundle mainBundle] resourcePath]];
    NSString *staticLinkResDir = [NSString stringWithFormat:@"%@", [[NSBundle mainBundle] resourcePath]];
    
    // Extra check because unfortunately the local SDK is called "AdheseSDK" whilst the Cocoapod is called "Adhese"
    BOOL localResDirExists = [self doesDirectoryExist:localResDir];
    BOOL cocoaPodResDirExists = [self doesDirectoryExist:cocoaPodResDir];
    BOOL staticLinkResDirExists = [self doesDirectoryExist:staticLinkResDir];
    
    if (!localResDirExists && !cocoaPodResDirExists && !staticLinkResDirExists) {
        [NSException raise:@"Critical error" format:@"Adhese could not load essential framework files."];
        return nil;
    }
    
    NSString *resDir = localResDirExists ? localResDir : (cocoaPodResDirExists ? cocoaPodResDir : staticLinkResDir);
    
    return [self loadSDKFileWithName:filename forPath:resDir];
}

+(NSString *)loadSDKFileWithName:(NSString *)filename forPath:(NSString *)path {
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", path, filename];
    return [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
}

+(BOOL)doesDirectoryExist:(NSString *)path {
    BOOL isDir = NO;
    return [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir] && isDir;
}

@end
