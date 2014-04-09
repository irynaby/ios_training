//
//  AppDelegate.m
//  dpremium
//
//  Created by Admin on 18/03/2014.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import "Users/User.h"
#import "Customers/Customer.h"
#import "Orders/Order.h"
#import "Categories/Categories.h"
#import "Products/Products.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //Cummon
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    
    User* user3 = nil;
    //Users
    @autoreleasepool {
        User* user = [[User alloc] initUser];
        User* user2 = [[User alloc] initWithName:@"Spirit" andAddress:@"Ivanovo 23" andBirthDate:[format  dateFromString:@"02.03.2000"] andUserId:1];
        
        user3 = [[User userWithName:@"Spirit" andAddress:@"Ivanovo 23" andBirthDate:[format dateFromString:@"02.03.2000"] andUserId:1] retain];
        
    }
    
    [User init];
    
    [User userWithName:@"Spirit" andAddress:@"Ivanovo 23" andBirthDate:[format dateFromString:@"02.03.2000"] andUserId:3];
    [User userWithName:@"Vasya" andAddress:@"Lubimova 23" andBirthDate:[format dateFromString:@"04.05.2002"] andUserId:1];
    
    [User deleteUserById: 1];
    
    [user3 release];
    user3 = nil;
    
    
    //Customers
    Customer * customer = [[Customer alloc] initCustomer];
    Customer * customer2 = [[Customer alloc] initWithUserId:1 andCustomerId:1 andShippingAddress:@"Gromova 16" andCustomerPhone:1234567];
    //Customer* customer3 = [[Customer alloc] initWithName:@"Drozdova 94" andAddress:<#(NSString *)#> andBirthDate:<#(NSDate *)#> andUserId:4];
    
    
    [Customer init];
    
    [Customer customerWithUserId: 1 andCustomerId: 2 andShippingAddress:@"Gromova 23" andCustomerPhone:1234567];
    [Customer customerWithUserId: 3 andCustomerId: 1 andShippingAddress:@"Pobedy 23" andCustomerPhone:1238567];
    
    [Customer deleteCustomerById: 1];
    
    //Orders
    Order* order = [[Order alloc] init];
    
    [order doNumOrder:132 andDate: [NSDate date] andUser:3];
    [order doNumOrder:123 andDate: [NSDate date] andUser:3];
    
    [order deleteOrderByNumOrder:132];
    
    //Products
    Products * products = [[Products alloc] init];
    [products createProductsTypes];
    [products productTypes];
    [products mutProductTypes];
    
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
