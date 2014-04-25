//
//  PremiumViewController.h
//  premium
//
//  Created by Admin on 16/04/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PremiumViewController : UIViewController{
    //UIButton *labelProduct;
    //UILabel *labelProduct;
}

@property (retain,nonatomic) UIButton *btnCategory;
@property (retain,nonatomic) UIButton *btnBack;
@property (retain,nonatomic) UILabel *lblProduct;

-(void)showCategoryPage;
-(void)showProductPage:(id) sender;
-(id)createBackBtn;

-(void)hideCategoryPage;

-(id)createCategoryBtn: (NSArray *)items;
-(id)createProductLabel:(NSArray *)items withCategoryId:catId;

-(id)jsonParsingCategory:url;
-(id)jsonParsingProduct:url withCategoryId:catId;

@end
