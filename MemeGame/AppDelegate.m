//
//  AppDelegate.m
//  MemeGame
//
//  Created by scott harris on 5/23/15.
//  Copyright (c) 2015 scott harris. All rights reserved.
//

#import "AppDelegate.h"
#import "TimelineTableViewController.h"
#import "testViewController.h"
#import <Parse/Parse.h>

@interface AppDelegate ()

@property (nonatomic) UINavigationController *navigationController;

@property(nonatomic) UITabBarController *tabBarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
     //Override point for customization after application launch.
    
     //[Optional] Power your app with Local Datastore. For more info, go to
   // https://parse.com/docs/ios_guide#localdatastore/iOS
    [Parse enableLocalDatastore];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"keys" ofType:@"plist"]];
    
    NSString *applicationId = [dictionary objectForKey:@"parseApplicationId"];
    NSString *clientKey = [dictionary objectForKey:@"parseClientKey"];

    // Initialize Parse.
    [Parse setApplicationId:applicationId
                  clientKey:clientKey];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    TimelineTableViewController *table = [[TimelineTableViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:table];
    
    testViewController *test = [[testViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:test];
    
    self.tabBarController = [[UITabBarController alloc] init];
    
    NSArray *controllers = [[NSArray alloc] initWithObjects:nav, nav2, nil];
    self.tabBarController.viewControllers = controllers;

    self.window.rootViewController = self.tabBarController;
    
    UITabBarController *tabBarController = self.tabBarController;
    UITabBar *tabBar = tabBarController.tabBar;
    
    tabBar.barTintColor = [UIColor colorWithRed:50/255 green:50/255 blue:50/255 alpha:0.7];
    tabBar.tintColor = [UIColor whiteColor];
    UITabBarItem *tab1 = [tabBar.items objectAtIndex:0];
    tab1.image = [UIImage imageNamed:@"Home-32"];
    UITabBarItem *tab2 = [tabBar.items objectAtIndex:1];
    tab2.image = [UIImage imageNamed:@"Home-32"];
    tab1.imageInsets = UIEdgeInsetsMake(6, 0, -5, 0);
    tab2.imageInsets = UIEdgeInsetsMake(6, 0, -5, 0);
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.window makeKeyAndVisible];
    
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
