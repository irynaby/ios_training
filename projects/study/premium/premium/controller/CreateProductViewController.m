//
//  CreateProductViewController.m
//  premium
//
//  Created by Admin on 08/05/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "CreateProductViewController.h"

@interface CreateProductViewController ()

@end

@implementation CreateProductViewController

@synthesize productNameTF = _productNameTF;
@synthesize productDescTF = _productDescTF;


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
    [self createNavBar];
    [self addTextField];
}

-(void) createNavBar {
    /*Create navBar*/
    UINavigationBar *navBar = [[[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)]autorelease];
    navBar.backgroundColor = [UIColor brownColor];
    navBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    UINavigationItem *navItem = [[[UINavigationItem alloc]init]autorelease];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(getUserText)];
    
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

-(UITextField *) productNameTF {
        UITextField *productNameTF = [[UITextField alloc] initWithFrame:CGRectMake(45, 30, 200, 40)];
        productNameTF.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:0.7];
        productNameTF.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        productNameTF.backgroundColor=[UIColor whiteColor];
        productNameTF.borderStyle = UITextBorderStyleRoundedRect;
        productNameTF.text=@"Enter Product name";
        [productNameTF setTag:1];
        self.productNameTF = productNameTF;
    
    return _productNameTF;
}

-(UITextView*) productDescriptionTF {
    if(!_productDescTF){
        UITextView *productDescTF = [[UITextView alloc] initWithFrame:CGRectMake(45, _productNameTF.frame.origin.y+75, 200, 40)];
        productDescTF.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:0.7];
        productDescTF.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        productDescTF.backgroundColor=[UIColor whiteColor];
        [productDescTF.layer setBorderColor:[[[UIColor grayColor]colorWithAlphaComponent:0.5]CGColor]];
        [productDescTF.layer setBorderWidth:1.0];
        productDescTF.layer.cornerRadius = 8;
        productDescTF.clipsToBounds = YES;
        productDescTF.text=@"Enter Description";
        [productDescTF setTag:2];
        self.productDescTF = productDescTF;
    }
    return _productDescTF;
}

-(void) addTextField {
    [self productNameTF];
    [self productDescriptionTF]; 
    
    UIView *viewTF = [[[UIView alloc] initWithFrame:CGRectMake(100, 200, 400, 400)]autorelease];
    [viewTF addSubview:_productNameTF];
    [viewTF addSubview:_productDescTF];
    
    [self.view addSubview:viewTF];
}

-(void)getUserText {
    NSLog(@"Product Name : %@, Product Description: %@", self.productNameTF,self.productDescTF);
    [self back];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    [_productDescTF release];
    [_productNameTF release];
    [super dealloc];
}

@end
