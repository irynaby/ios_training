//
//  CreateCategoryViewController.m
//  premium
//
//  Created by Admin on 24/04/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "CreateCategoryViewController.h"

@interface CreateCategoryViewController ()

@end

@implementation CreateCategoryViewController

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
    
    [self addTextField];
    [self createNavBar];
    
}

-(void) createNavBar {
    /*Create navBar*/
    UINavigationBar *navBar = [[[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)]autorelease];
    navBar.backgroundColor = [UIColor brownColor];
    navBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    UINavigationItem *navItem = [[[UINavigationItem alloc]init]autorelease];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    navItem.leftBarButtonItem = backBtn;
    navItem.rightBarButtonItem = doneBtn;
    
    navBar.items = @[ navItem ];
    [self.view addSubview:navBar];
    [backBtn release];
    [doneBtn release];
}

-(void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addTextField{
    UILabel *titleLabel = [[[UILabel alloc]init]autorelease];
    titleLabel.frame = CGRectMake( 50, 150, 210, 50 );
    titleLabel.text = @"Add category name:";
    [titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [titleLabel sizeToFit];
    
    UITextField *textField = [[[UITextField alloc]initWithFrame:CGRectMake( 100, 150, 280, 30 )]autorelease];
    textField.placeholder = @"Enter new category name";
    textField.textColor = [UIColor blackColor];
    textField.backgroundColor = [UIColor clearColor];
    [textField setFont:[UIFont boldSystemFontOfSize:12]];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [self.view addSubview:textField];
    //sets the delegate to the current class
    textField.delegate = self; 
 
}

-(void) textFieldDidBeginEditing: (UITextField *) textField {
    NSLog(@"Text field did begin editing");
}

-(void) textFieldDidEndEditing:(UITextField *) textField {
    NSLog(@"Text field did end editing");
}

-(BOOL) textFieldShouldReturn: (UITextField *) textField{
    [textField resignFirstResponder];
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)dealloc{
    
    [super dealloc];
}

@end
