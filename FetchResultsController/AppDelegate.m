//
//  AppDelegate.m
//  FetchResultsController
//
//  Created by wangwenbing on 2017/4/5.
//  Copyright © 2017年 Centit. All rights reserved.
//

#import "AppDelegate.h"
#import "FetchResultsController-Bridging-Header.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"FetchResults.sqlite"];
    [self insertAnimal];
    // Override point for customization after application launch.
    return YES;
}


- (void)insertAnimal
{
    Mammal *mammal = [Mammal MR_createEntity];
    mammal.eatFood = @"我喜欢吃草";
    mammal.sleepDec = @"早睡早起身体好";
    mammal.suckle = @"你是喝羊奶长大的";
    mammal.walk = @"我喜欢在草原上奔跑";
  
    Bird *bird = [Bird MR_createEntity];
    bird.eatFood = @"我喜欢吃种子";
    bird.sleepDec = @"我喜欢在树上睡";
    bird.feed = @"我饿极的时候，还会吃粮食";
    bird.fly = @"我自由自在的在天上飞";

    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [MagicalRecord cleanUp];
}


@end
