//
//  MainViewController.h
//  Adhese SDK Sample
//
//  Created by Axel Jonckheere on 10/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AdheseSDK/AdView.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController <AdViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *halfPageContainerView;
@property (weak, nonatomic) IBOutlet UIView *billboardContainerView;

@end

NS_ASSUME_NONNULL_END
