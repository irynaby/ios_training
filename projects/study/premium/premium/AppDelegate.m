//
//  AppDelegate.m
//  premium
//
//  Created by Admin on 16/04/2014.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import "PremiumViewController.h"
#import "CreateCategoryViewController.h"

//@synthesize window, navController, premiumController;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //check if the first viewcontroller exists, otherwise create it
    if(self.premiumController == nil)
    {
        PremiumViewController *contr = [[[PremiumViewController alloc] initWithNibName:nil bundle:nil]autorelease];
        //self.window.rootViewController = contr;
        self.premiumController = contr;
    }
    //CreateCategoryViewController *createContr1 = [[[CreateCategoryViewController alloc]init]autorelease];
    //self.window.rootViewController = createContr1;
    
    //create the navigation controller and add the controllers view to the window
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:self.premiumController];
    
    //set nav bar bkgr color
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:224/255.0f green:155/255.0f blue:43/255.0f alpha:1.0f]];
    
    //changing the font of nav bar title
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
    
    //customize the nav btn color
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    //set the navConntroller property
    [self setNavController:nav];
    
    //release nav controller
    [nav release];
    
    [self.window addSubview:[nav view]];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
@end
