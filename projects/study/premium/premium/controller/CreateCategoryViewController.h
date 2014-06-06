//
//  CreateCategoryViewController.h
//  premium
//
//  Created by Admin on 24/04/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateCategoryViewController : UIViewController<UITextFieldDelegate>

@property (retain,nonatomic) UILabel *titleLabel;
@property (retain,nonatomic) UITextField *textField;
@property (retain,nonatomic) UINavigationItem *navItem;
@property (retain,nonatomic) UINavigationBar *navBar;
@property (retain, nonatomic) UIBarButtonItem *backBtn;
@property (retain, nonatomic) UIBarButtonItem *doneBtn;

-(void)addTextField;
-(void) textFieldDidBeginEditing: (UITextField *) textField;
-(void) textFieldDidEndEditing:(UITextField *) textField;
-(BOOL) textFieldShouldReturn: (UITextField *) textField;
-(void) createNavBar;
-(void)back;

@end
