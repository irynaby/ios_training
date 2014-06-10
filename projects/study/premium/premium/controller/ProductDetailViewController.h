//
//  ProductDetailViewController.h
//  premium
//
//  Created by Admin on 26/05/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PremiumViewController.h"
@class PremiumViewController;

@interface ProductDetailViewController : UIViewController

@property (nonatomic,retain) PremiumViewController *product;
@property (nonatomic, retain) UILabel *productName, *prodPrice, *prodDesc;
@property (nonatomic, retain) NSString *prodImage;

-(void)showDetailPage;
-(void)Back;

@end