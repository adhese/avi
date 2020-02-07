//
//  ViewUtils.h
//  Adhese SDK
//
//  Created by Axel Jonckheere on 07/02/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewUtils : NSObject

+(UIView * _Nullable)findRootViewOfView:(UIView *)view forType:(Class)type;
+(BOOL)isVisible:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
