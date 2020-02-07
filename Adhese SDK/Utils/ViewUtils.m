//
//  ViewUtils.m
//  Adhese SDK
//
//  Created by Axel Jonckheere on 07/02/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import "ViewUtils.h"

@implementation ViewUtils

+(UIView * _Nullable)findRootViewOfView:(UIView *)view forType:(Class)type {
    
    if (!view.superview) {
        return nil;
    }
    
    if ([view.superview isKindOfClass:type]) {
        return view.superview;
    }
    
    return [self findRootViewOfView:view.superview forType:type];
}

+(BOOL)isVisible:(UIView *)view {
    if (view.hidden || !view.superview) {
        return false;
    }
    
    UIViewController *rootViewController = [[UIApplication sharedApplication] keyWindow].rootViewController;
    if (!rootViewController || !rootViewController.view) {
        return false;
    }
    
    UIView *rootView = rootViewController.view;
    
    CGFloat topSafeArea;
    CGFloat bottomSafeArea;
    CGRect viewFrame = [view convertRect:view.bounds toCoordinateSpace:rootView];

     if (@available(iOS 11, *)) {
         topSafeArea = rootView.safeAreaInsets.top;
         bottomSafeArea = rootView.safeAreaInsets.bottom;
    } else {
        topSafeArea = rootViewController.topLayoutGuide.length;
        bottomSafeArea = rootViewController.bottomLayoutGuide.length;
    }
    
    return CGRectGetMinX(viewFrame) >= 0 &&
        CGRectGetMaxX(viewFrame) <= rootView.bounds.size.width &&
        CGRectGetMinY(viewFrame) >= topSafeArea &&
        CGRectGetMaxY(viewFrame) <= rootView.bounds.size.height - bottomSafeArea;
}

@end
