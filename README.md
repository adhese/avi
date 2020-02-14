# Adhese iOS SDK
## Introduction
This is the Adhese SDK for native iOS. The SDK enables you to load ad data from the Adhese API and to display them with a native view.

## Adding the SDK

The SDK is available via Cocopods. Add the following to your `Podfile` and run `pod install`

    pod 'Adhese', '~> 1.0.1'


## Code example
Initialise the SDK once for the application. This should be called in your AppDelegate class. Preferably in the `willFinishLaunchingWithOptions` method, otherwise errors might occur because the SDK could be called before it was properly initialised.

    #import <AdheseSDK/Adhese.h>
    
    - (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {
        
        // Initialise the Adhese SDK
        [Adhese initializeSdk:@"<YOUR_ACCOUNT>" withDebuggingEnabled:YES];
        
        return YES;
    }


Add an UIView to your storyboard or .xib and set the class to `AdView` in the identity inspector.

![AdView class](https://i.imgur.com/cFjn2vi.png "AdView class")

The SDK is now ready to fetch ad data. Here's an example on how to fetch ad data (for example in the `viewDidLoad`):

    #import <AdheseSDK/Adhese.h>
    #import <AdheseSDK/CookieMode.h>
    
    AdheseOptions *options = [[AdheseOptions alloc] initWithLocation:@"_demo_ster_a_"];
    options.cookieMode = kAll;
    options.slots = @[@"billboard", @"halfpage"];
    
    [Adhese loadAds:options withCompletionHandler:^(NSArray<Ad *> * _Nonnull ads, AdheseError * _Nullable error) {
        
        if (error) {
            NSLog(@"Failed loading ads with errors: %@", error.description);
            return;
        }
          
        Ad *billboard = [self findAd:ads byType:@"billboard"];
        Ad *halfPage = [self findAd:ads byType:@"halfpage"];

        if (billboard) {
            [self.billboardAdview setAd:billboard];
        } else {
            [self.billboardAdview setHidden:YES];
        }

        if (halfPage) {
            [self.halfpageAdView setAd:halfPage];
        } else {
            [self.halfpageAdView setHidden:YES];
        }
    }];

If you want to receive delegate events you can apply the `AdViewDelegate` to your ViewController. The following optional delegate methods can be implemented.

    - (void)adDidLoad:(id)adView withError:(AdheseError * _Nullable)error;                      // Triggers when the ad is loaded inside the view
    - (void)trackerWasNotified:(id)adView withError:(AdheseError * _Nullable)error;             // Triggers when the tracker URL has been called.
    - (void)viewImpressionWasNotified:(id)adView withError:(AdheseError * _Nullable)error;      // Triggers when the ad has become visible in the viewport
    - (void)adClicked:(id)adView withError:(AdheseError * _Nullable)error;                      // Triggers when the advertisement was clicked.

### Extra
Set `adView.shouldOpenAd = NO` to enable/disable automatic opening of the ad in the browser. The default value is true, so it will open automatically. However, when setting it to false and implementing the `adClicked` delegate you can implement custom behaviour.

## Publishing the SDK
1. Change the version number in the `Adhese.podspec file` 
2. Commit the changes to Github 
3. Tag your commit with the same version as specified in the podspec file
4. Execute `pod trunk push` via the terminal at the root folder of the project and follow the instructions

ℹ️  For the whole process from start to finish (including initial publishing) see this [excellent blogpost](https://medium.com/flawless-app-stories/create-your-own-cocoapods-library-da589d5cd270).

ℹ️  For more information about managing maintainers see [this article](https://guides.cocoapods.org/making/making-a-cocoapod.html).
