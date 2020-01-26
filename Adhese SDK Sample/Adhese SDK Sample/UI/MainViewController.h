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

@property (weak, nonatomic) IBOutlet UIStackView *billboardContainerView;
@property (weak, nonatomic) IBOutlet UIStackView *halfPageContainerView;

@end

NS_ASSUME_NONNULL_END
