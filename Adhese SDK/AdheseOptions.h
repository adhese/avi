//
//  AdheseOptions.h
//  Adhese SDK
//
//  Created by Axel Jonckheere on 08/01/2020.
//  Copyright © 2020 Axel Jonckheere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Device.h"
#import "URLParameter.h"

NS_ASSUME_NONNULL_BEGIN

@interface AdheseOptions : NSObject <URLParameter>

@property (nonatomic, strong) NSString* location;
@property (nonatomic, strong) NSArray<NSString *>* slots;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSMutableSet<NSString *>*>* customParameters;
@property (nonatomic, strong) NSString* cookieMode;
@property (nonatomic, strong) Device* device;

- (NSString *)getAsURL;
- (id)initWithLocation:(NSString *)location;


/*
    Adds a new value for a custom target.
 
    It's the responsibility of the caller to url-escape value if needed.
 
    Returns self
 */

- (id)addCustomParameterRawWithKey:(NSString *) key andValue:(NSString *) value;

/*
   Adds new values for a custom target.

   It's the responsibility of the caller to url-escape values if needed.

   Returns self
*/

- (id)addCustomParameterRawWithKey:(NSString *) key andValues:(NSSet<NSString *> *) values;

/*
   Adds new values for a custom target.

   It's the responsibility of the caller to url-escape values if needed.

   Returns self
*/

- (id)addCustomParametersRaw:(NSDictionary<NSString *, NSSet<NSString *> *> *) dict;

/*
   Removes all values for all custom targets.

   Returns self
*/

- (id)removeCustomParameters;

/*
   Removes all values for a custom target.

   Returns self
*/

- (id)removeCustomParameterForKey:(NSString *) key;

@end

NS_ASSUME_NONNULL_END
