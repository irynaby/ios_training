//
//  AboutViewController.m
//  premium
//
//  Created by Admin on 23/06/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

@synthesize aboutTitleLabel = _aboutTitleLabel;
@synthesize aboutTextLabel = _aboutTextLabel;
@synthesize textField = _textField;
@synthesize sendEmailBtn = _sendEmailBtn;
@synthesize cancelBtn = _cancelBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupLabel];
    [self setupEmailForm];
}

-(void) setupLabel{
    
	UILabel *aboutTitleLabel = [[UILabel alloc] init];
    
	aboutTitleLabel.backgroundColor = [UIColor clearColor];
	aboutTitleLabel.textColor = [UIColor redColor];
	aboutTitleLabel.font = [UIFont fontWithName:@"Verdana" size:18.0];
    
	
	aboutTitleLabel.text = @"МАГАЗИН ОДЕЖДЫ";
    
	aboutTitleLabel.shadowColor = [UIColor darkGrayColor];
	aboutTitleLabel.shadowOffset = CGSizeMake(1.0,1.0);
    self.aboutTitleLabel = aboutTitleLabel;
    self.aboutTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    UILabel *aboutTextLabel =[[UILabel alloc] initWithFrame:CGRectMake(aboutTitleLabel.frame.origin.x, aboutTitleLabel.frame.origin.y +30, 400, 190)];
    
    aboutTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    aboutTextLabel.textAlignment = NSTextAlignmentLeft;
    aboutTextLabel.numberOfLines = 9;
    aboutTextLabel.text = @"Интернет-магазин по продаже одежды.\nВремя работы: \nс 9:00 до 21:00, выходные суббота и воскресенье.\nКонтактные телефоны: \nМТС (+375) 29 28 333 25, \nVelcom (+375) 29 154 71 34, \nLife:) (+375) 25 97 668 36.";
    self.aboutTextLabel = aboutTextLabel;
    self.aboutTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
	[self.view addSubview: self.aboutTitleLabel];
    [self.view addSubview: self.aboutTextLabel];
    
    //add constraints
    NSLayoutConstraint *aboutTitleLabelTopConstraint = [NSLayoutConstraint
                                                     constraintWithItem:self.aboutTitleLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                     toItem:self.view
                                                     attribute:NSLayoutAttributeTop
                                                     multiplier:1.0
                                                     constant:60.0f];
    NSLayoutConstraint *aboutTitleLabelLeftConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.aboutTitleLabel
                                                        attribute:NSLayoutAttributeLeading
                                                        relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                        toItem:self.view
                                                        attribute:NSLayoutAttributeLeading
                                                        multiplier:1.0
                                                        constant:20.0f];

    NSLayoutConstraint *aboutTextLabelTopConstraint = [NSLayoutConstraint
                                                        constraintWithItem:self.aboutTextLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                        toItem:self.aboutTitleLabel
                                                        attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                        constant:30.0f];
    NSLayoutConstraint *aboutTextLabelLeftConstraint = [NSLayoutConstraint
                                                         constraintWithItem:self.aboutTextLabel
                                                         attribute:NSLayoutAttributeLeading
                                                         relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                         toItem:self.view
                                                         attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                         constant:20.0f];
    [self.view addConstraints:@[aboutTitleLabelTopConstraint,aboutTitleLabelLeftConstraint,aboutTextLabelTopConstraint,aboutTextLabelLeftConstraint]];
}

-(void) setupEmailForm {
    
    [self setupTextField];
    [self setupSendBtn];
    [self setupCancelBtn];
}

-(void)setupTextField{
    //Create textField
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 60, self.view.bounds.size.width-20, 50)];
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    
    [textField setPlaceholder:@"Введите сообщение"];
    textField.backgroundColor = [UIColor lightGrayColor];
    textField.textAlignment = NSTextAlignmentLeft;
    
    self.textField = textField;
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.textField];
    //add constraints
    NSLayoutConstraint *textFieldTopConstraint = [NSLayoutConstraint
                                                  constraintWithItem:self.textField
                                                  attribute:NSLayoutAttributeTop
                                                  relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                  toItem:self.aboutTextLabel
                                                  attribute:NSLayoutAttributeBottom
                                                  multiplier:1.0
                                                  constant:60.0f];
    
    NSLayoutConstraint *textFieldBottomConstraint = [NSLayoutConstraint
                                                     constraintWithItem:self.textField
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                     toItem:self.sendEmailBtn
                                                     attribute:NSLayoutAttributeTop
                                                     multiplier:1.0
                                                     constant:-60.0f];
    
    NSLayoutConstraint *textFieldLeftConstraint = [NSLayoutConstraint
                                                   constraintWithItem:self.textField
                                                   attribute:NSLayoutAttributeLeft
                                                   relatedBy:NSLayoutRelationEqual
                                                   toItem:self.view
                                                   attribute:NSLayoutAttributeLeft
                                                   multiplier:1.0
                                                   constant:30.0f];
    
    NSLayoutConstraint *textFieldRightConstraint = [NSLayoutConstraint
                                                    constraintWithItem:self.textField
                                                    attribute:NSLayoutAttributeRight
                                                    relatedBy:NSLayoutRelationEqual
                                                    toItem:self.view
                                                    attribute:NSLayoutAttributeRight
                                                    multiplier:1.0
                                                    constant:-30.0f];
    
    [self.view addConstraints:@[textFieldBottomConstraint,
                                textFieldLeftConstraint,
                                textFieldRightConstraint,
                                textFieldTopConstraint]];
}

-(void)setupSendBtn {
    //create send btn
    UIButton *sendEmailBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.sendEmailBtn = sendEmailBtn;
    self.sendEmailBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.sendEmailBtn setTitle:@"Отправить" forState:UIControlStateNormal];
    [self.view addSubview:self.sendEmailBtn];
    
    //add constraint for the btn (x position)
    NSLayoutConstraint *sendEmailBtnXConstrant = [NSLayoutConstraint
                                                  constraintWithItem:self.sendEmailBtn
                                                  attribute:NSLayoutAttributeCenterX
                                                  relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                  toItem:self.view
                                                  attribute:NSLayoutAttributeCenterX
                                                  multiplier:1.0
                                                  constant:60.0f];
    
    //add constraint for the btn (top position)
    NSLayoutConstraint *sendEmailBtnTopConstrant = [NSLayoutConstraint
                                                    constraintWithItem:self.sendEmailBtn
                                                    attribute:NSLayoutAttributeTop
                                                    relatedBy:NSLayoutRelationEqual
                                                    toItem: self.textField
                                                    attribute:NSLayoutAttributeCenterY
                                                    multiplier:1.0
                                                    constant:60.0f];
    
    [self.view addConstraints:@[sendEmailBtnXConstrant,sendEmailBtnTopConstrant]];
}

-(void)setupCancelBtn {
    //create send btn
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.cancelBtn = cancelBtn;
    self.cancelBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.cancelBtn setTitle:@"Отменить" forState:UIControlStateNormal];
    [self.view addSubview:self.cancelBtn];

    //add constraint for the btn (x position)
    NSLayoutConstraint *sendEmailBtnXConstrant = [NSLayoutConstraint
                                                  constraintWithItem:self.cancelBtn
                                                  attribute:NSLayoutAttributeCenterX
                                                  relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                  toItem:self.view
                                                  attribute:NSLayoutAttributeCenterX
                                                  multiplier:1.0
                                                  constant:-60.0f];
    
    //add constraint for the btn (top position)
    NSLayoutConstraint *sendEmailBtnTopConstrant = [NSLayoutConstraint
                                                    constraintWithItem:self.cancelBtn
                                                    attribute:NSLayoutAttributeTop
                                                    relatedBy:NSLayoutRelationEqual
                                                    toItem: self.textField
                                                    attribute:NSLayoutAttributeCenterY
                                                    multiplier:1.0
                                                    constant:60.0f];
    
    [self.view addConstraints:@[sendEmailBtnXConstrant,sendEmailBtnTopConstrant]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [_aboutTitleLabel release];
    [_aboutTextLabel release];
    [_textField release];
    [_sendEmailBtn release];
    [_cancelBtn release];
    
    [super dealloc];
}


@end
