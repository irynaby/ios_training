//
//  AboutViewController.h
//  premium
//
//  Created by Admin on 23/06/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PremiumViewController.h"

@interface AboutViewController : UIViewController

@property (retain, nonatomic) UILabel *aboutTitleLabel;
@property (retain, nonatomic) UILabel *aboutTextLabel;
@property (retain, nonatomic) UITextField *textField;
@property (retain, nonatomic) UIButton *sendEmailBtn;
@property (retain, nonatomic) UIButton *cancelBtn;

-(void) setupEmailForm;
-(void)setupSendBtn;
-(void)setupTextField;
-(void)setupCancelBtn;

@end
