//
//  AppDelegate.m
//  dpremium
//
//  Created by Admin on 18/03/2014.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import "User.h"
#import "Customer.h"
#import "Order.h"
#import "ProductCategory.h"
#import "Product.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //=====Category
    NSMutableArray *arr = [ProductCategory createTestCategories];
    for (ProductCategory *cat in arr) {
        [cat createTestCategoryProducts];
    }
    
    ProductCategory *cat = [ProductCategory GiveMeBestCategory:arr withComparator:^ComparatorResult(ProductCategory *obj1, ProductCategory *obj2) {
        if ([obj1.categoryProducts count ] > [obj2.categoryProducts count]) {
            //NSLog(@"First is Best");
            return FirstIsBest;
        }
        else if ([obj1.categoryProducts count ] < [obj2.categoryProducts count]){
            //NSLog(@"Second is Best");
            return SecondIsBest;
        }
        else
            //NSLog(@"Are Equal");
            return AreEqual;
    }];
    
    
    //Create new category
    ProductCategory *newCategor = [[ProductCategory alloc] init];
    newCategor.categoryName = @"NewCategory";
    [arr addObject:newCategor];
    [newCategor release];
    
    //Update categoryName for 1
    ProductCategory *clothsCategory = [arr objectAtIndex:1];
    clothsCategory.categoryName = @"Cloths new";
    
    //Added new product
    Product *newClothsProduct = [[Product alloc] init];
    newClothsProduct.productName = @"Dress";
    
    [clothsCategory addProduct:newClothsProduct];
    NSArray *sortedClothsProducts = [clothsCategory sortedCategoryProducts];
    
    @autoreleasepool {
    //ProductCategory *category = [[ProductCategory alloc] init];
    }
    //=====Cummon
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    
    //=====Users
    User* user3 = nil;
    @autoreleasepool {
        User* user = [[User alloc] initUser];
        User* user2 = [[User alloc] initWithName:@"Sidorov Ivan" andAddress:@"Ivanovo 23" andBirthDate:[format  dateFromString:@"02.03.2000"] andUserId:1];
        
        user3 = [[User userWithName:@"Smirnova Lena" andAddress:@"Pobedy 3" andBirthDate:[format dateFromString:@"02.08.2000"] andUserId:1] retain];
        
    }
    
    [[User alloc] init];
    
    [User userWithName:@"Spirit" andAddress:@"Ivanovo 23" andBirthDate:[format dateFromString:@"02.03.2000"] andUserId:3];
    [User userWithName:@"Vasya" andAddress:@"Lubimova 23" andBirthDate:[format dateFromString:@"04.05.2002"] andUserId:1];
    
    [User deleteUserById: 1];
    
    [user3 release];
    user3 = nil;
    
    
    
    //=====Customers
    Customer * customer2 = nil;
    Customer * customer3 = nil;
    @autoreleasepool {
       customer2 = [[Customer alloc] initWithUserId:1 andCustomerId:1 andShippingAddress:@"Gromova 16" andCustomerPhone:1234567];
       customer3 = [[Customer alloc] initWithUserId:1 andCustomerId:3 andShippingAddress:@"Gromova 32" andCustomerPhone:7634567];
    }
    
    [[Customer alloc] init];
    
    //[Customer customerWithUserId: 1 andCustomerId: 2 andShippingAddress:@"Gromova 23" andCustomerPhone:1234567];
    //[Customer customerWithUserId: 3 andCustomerId: 1 andShippingAddress:@"Pobedy 23" andCustomerPhone:1238567];
    
    [Customer deleteCustomerById: 1];
    
    [customer2 release];
    customer2 = nil;
    
    [customer3 release];
    customer3 = nil;
    
    //=====Orders
    /*Order *order1 = nil;
    @autoreleasepool {
        order1 = [[Order alloc] initOrder];
    }
        Order* order = [[Order alloc] init];
    
       [Order doNumOrder:132 andDate: [NSDate date] andUser:3 andProductId:1];
       [Order doNumOrder:123 andDate: [NSDate date] andUser:3 andProductId:1];
    
    [Order deleteOrderByNumOrder:132];
    
    [order1 release];
     order1 = nil;
    */
    
    //Products
    ProductCategory *category1 = [[ProductCategory alloc] init];
    
    Product *prod1 = [Product productWithId:1 andName:@"Ked"];
    prod1.productCategory = category1;
    [category1 addProduct:prod1];
    
    //Product *prod2 = [category1 findProductById:1];

    
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
