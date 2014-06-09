//
//  ProductDetailViewController.m
//  premium
//
//  Created by Admin on 26/05/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ProductDetailViewController.h"


@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

@synthesize product;
@synthesize productName, prodPrice, prodDesc;

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
    
    NSLog(@"Product detail view is loading.... ");
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.productName = [[UILabel alloc]init];
    [self.productName setFrame:CGRectMake(10, 80, self.view.frame.size.width, 30)];
    [self.productName setText:[NSString stringWithFormat:@"Наименование %@", [product valueForKey:@"name"]]];
    [self.view addSubview: self.productName];
    
    self.prodPrice = [[UILabel alloc]init];
    [self.prodPrice setFrame:CGRectMake(10, self.productName.frame.origin.y + 40, self.view.frame.size.width, 30)];
    [self.prodPrice setText:[NSString stringWithFormat:@"Цена: %@ бел.руб.", [product valueForKey:@"price"]]];
    [self.view addSubview: self.prodPrice];
    
    self.prodDesc = [[UILabel alloc]init];
    [self.prodDesc setFrame:CGRectMake(10, self.prodPrice.frame.origin.y + 40, self.view.frame.size.width, 100)];
    [self.prodDesc setText:[NSString stringWithFormat:@"Описание: %@", [product valueForKey:@"desc"]]];
    [self.view addSubview: self.prodDesc];
    
    /*
    self.prodImage = [[UILabel alloc]init];
    [self.prodImage setFrame:CGRectMake(10, self.prodPrice.frame.origin.y + 40, self.view.frame.size.width, 100)];
    [self.prodImage setText:[NSString stringWithFormat:@"Описание: %@", [product valueForKey:@"pic_big"]]];
    [self.view addSubview: self.prodDesc];
    */
    //[self createNavBar];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //set the title of the navigation view
    [self.navigationItem setTitle:@"Детали"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Назад" style:UIBarButtonItemStyleBordered target:self action:@selector(Back)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = nil;
}

-(void)Back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc {
    [product release];
    [productName release];
    [prodPrice release];
    [prodDesc release];
   // [navigationController release];
    [super dealloc];
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

@end
