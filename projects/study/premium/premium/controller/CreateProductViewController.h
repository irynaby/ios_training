//
//  CreateProductViewController.h
//  premium
//
//  Created by Admin on 08/05/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateProductViewController : UIViewController

@property (retain,nonatomic) UITextField *productNameTF;
@property (retain,nonatomic) UITextView *productDescTF;

-(void) createNavBar;
-(void)back;

-(UITextField *) productNameTF;
-(UITextField*) productDescriptionTF;

-(void) addTextField;

-(void)getUserText;

@end
