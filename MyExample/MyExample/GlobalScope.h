//
//  GlobalScope.h
//  Restaurant Roulette
//
//  Created by Wang Ri on 1/12/16.
//  Copyright © 2016 Wang Ri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GlobalScope : NSObject

extern CGFloat convertMileToKilometre;
extern NSArray *arrPriceLevels;
extern NSUserDefaults *defaults;
extern NSString *sPriceLevelStorageKey;
extern NSString *sDistanceLevelStorageKey;
extern NSString *distanceUnitStorageKey;
extern NSString *defaultLimit;
extern NSString *defaultSort;
extern NSString *defaultRadiusFilter;

@end
