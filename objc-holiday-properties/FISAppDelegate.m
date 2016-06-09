//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
// What would this be instead?
    return [self.database[season] allKeys];
    
//    - (NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database
//    {
//        return [database objectForKey:season];
//    }
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
//- (NSArray *)suppliesInHoliday:(NSString *)holiday
//inSeason:(NSString *)season
//inDatabase:(NSDictionary *)database
//    {
//        return [[database objectForKey:season] objectForKey:holiday];
//    }
    NSMutableArray *suppliesInHolidayAndInSeason;
    suppliesInHolidayAndInSeason = self.database[season][holiday];
    
    return suppliesInHolidayAndInSeason;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
//    - (BOOL)holiday:(NSString *)holiday
//isInSeason:(NSString *)season
//inDatabase:(NSDictionary *)database
//    {
//        return [[database objectForKey:season] objectForKey:holiday];
//    }
    
    
    return [[self.database[season]allKeys] containsObject:holiday] ;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    return [self.database[season][holiday] containsObject:supply];
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    self.database[season][holiday] = [[NSMutableArray alloc]init];

}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    [self.database[season][holiday] addObject:supply];
    // no return
}

@end
