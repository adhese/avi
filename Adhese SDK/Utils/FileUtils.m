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
    NSString *resDir = [NSString stringWithFormat:@"%@/Frameworks/AdheseSDK.framework", [[NSBundle mainBundle] resourcePath]];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", resDir, filename];
    return [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
}

@end
