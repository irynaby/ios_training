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

@synthesize product = _product;
@synthesize productName = _productName, prodPrice = _prodPrice, prodDesc = _prodDesc, prodImage = _prodImage;

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
    [self showDetailPage];
    
    //set the title of the navigation view
    [self.navigationItem setTitle:@"Детали"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Назад" style:UIBarButtonItemStyleBordered target:self action:@selector(Back)];
    self.navigationItem.leftBarButtonItem = backButton;
    self.navigationItem.rightBarButtonItem = nil;
}

-(void)showDetailPage{
    
    self.productName = [[UILabel alloc]init];
    [self.productName setFrame:CGRectMake(self.view.frame.size.width/4 + 50, 80, self.view.frame.size.width, 30)];
    [self.productName setText:[NSString stringWithFormat:@"Наименование %@", [self.product valueForKey:@"name"]]];
    self.productName.lineBreakMode = NSLineBreakByWordWrapping;
    [self.view addSubview: self.productName];
    
    self.prodPrice = [[UILabel alloc]init];
    [self.prodPrice setFrame:CGRectMake(self.view.frame.size.width/4 + 50, self.productName.frame.origin.y + 40, self.view.frame.size.width, 30)];
    [self.prodPrice setText:[NSString stringWithFormat:@"Цена: %@ бел.руб.", [self.product valueForKey:@"price"]]];
    [self.view addSubview: self.prodPrice];
    
    self.prodDesc = [[UILabel alloc]init];
    [self.prodDesc setFrame:CGRectMake(self.view.frame.size.width/4 + 50, self.prodPrice.frame.origin.y + 40, self.view.frame.size.width, 100)];
    [self.prodDesc setText:[NSString stringWithFormat:@"Описание: %@", [self.product valueForKey:@"desc"]]];
    self.prodDesc.lineBreakMode = NSLineBreakByWordWrapping;
    [self.view addSubview: self.prodDesc];
    
    NSString * prodImage = [self.product valueForKey:@"pic_big"];
    self.prodImage = [NSString stringWithFormat:@"http://secondstock.by/img_sh/%@",prodImage];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), ^{
        //Code in background
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString: self.prodImage]];
        UIImage *pic = [UIImage imageWithData:imageData];
        dispatch_async(dispatch_get_main_queue(), ^{
            //code for main thread
            UIImageView *imageView = [[[UIImageView alloc] initWithImage:pic] autorelease];
            
            [imageView setFrame:CGRectMake(30, 80, self.view.frame.size.width/4, self.view.frame.size.height/4)];
            [self.view addSubview: imageView];
            imageView.contentMode = UIViewContentModeScaleAspectFit;            
        });
    });
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
    [_product release];
    [_productName release];
    [_prodPrice release];
    [_prodDesc release];
    [_prodImage release];
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
