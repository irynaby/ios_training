//
//  AppDelegate.h
//  premium
//
//  Created by Admin on 16/04/2014.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PremiumViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain,nonatomic) UINavigationController *navController;
@property (retain,nonatomic) PremiumViewController *premiumController;

@end
