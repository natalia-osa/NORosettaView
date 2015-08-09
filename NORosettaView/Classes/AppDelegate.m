//
//  ViewController.m
//  RosettaView
//
//  Created by Natalia Osiecka on 25.3.2015.
//  Copyright (c) 2015 iOskApps. All rights reserved.
//

#import "AppDelegate.h"
#import "Example1ViewController.h"
#import "Example2ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // create a window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    
    // create the controllers
    UIViewController *viewController1 = [[Example1ViewController alloc] init];
    UINavigationController *navigationController1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    
    UIViewController *viewController2 = [[Example2ViewController alloc] init];
    UINavigationController *navigationController2 = [[UINavigationController alloc] initWithRootViewController:viewController2];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:@[navigationController1, navigationController2]];
    [self.window setRootViewController:tabBarController];
    
    return YES;
}

@end
