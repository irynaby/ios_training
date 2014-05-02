//
//  PremiumViewController.m
//  premium
//
//  Created by Admin on 16/04/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "PremiumViewController.h"

@interface PremiumViewController ()
    @property (retain) NSMutableArray* LCCategories;

@end

@implementation PremiumViewController

@synthesize btnCategory = _btnCategory;
@synthesize btnBack = _btnBack;
@synthesize lblProduct = _lblProduct;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.LCCategories = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self jsonParsingCategory:@"http://www.irinap.com/jsonws/categories.php"];
    UIApplication *app = [UIApplication sharedApplication];
    UIInterfaceOrientation currentOrientation = app.statusBarOrientation;
    [self doLayoutForOrientation:currentOrientation];
}

-(void) loadView{
    CGRect screenArea = [[UIScreen mainScreen] applicationFrame];
    
    UIView *viewArea = [[[UIView alloc] initWithFrame:screenArea]autorelease];
    viewArea.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.view = viewArea;
    
    viewArea = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenArea.size.width, screenArea.size.height)];
    viewArea.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:viewArea];

}

-(id)createBackBtn{
    UIFont *buttonFont = [UIFont fontWithName:@"Geneva" size:17.0];
    UIColor *buttonColorBackgroundDefault = [UIColor colorWithRed:0.82 green:0.643 blue:0.639 alpha:1.0];
    
    UIButton *buttonBack = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 110, 30)];
    [buttonBack setShowsTouchWhenHighlighted:TRUE];
    [buttonBack addTarget:self action:@selector(showCategoryPage) forControlEvents:UIControlEventTouchDown];
    [buttonBack setTitle:@"Back" forState:UIControlStateNormal];
    [buttonBack.titleLabel setFont:buttonFont];
    buttonBack.backgroundColor = buttonColorBackgroundDefault;
    buttonBack.layer.cornerRadius = 10;
    [[buttonBack retain]autorelease];

    self.btnBack = buttonBack;
    [self.view addSubview:buttonBack];
    
    return self.btnBack;
}

-(id)createCategoryBtn:(NSArray *)items{
    //btns properties
    UIFont *buttonFont = [UIFont fontWithName:@"Geneva" size:17.0];
    UIColor *buttonColorDefault = [UIColor colorWithRed:0.357 green:0.18 blue:0.176 alpha:1.0];
    UIColor *buttonColorBackgroundDefault = [UIColor colorWithRed:0.82 green:0.643 blue:0.639 alpha:1.0];

    // building the btn Category
    
    for(int i=0; i < [items count]; i++){
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn.titleLabel setFont:buttonFont];
        [btn setTintColor:buttonColorDefault];
        
        [btn addTarget:self action:@selector(showProductPage:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.backgroundColor = buttonColorBackgroundDefault;
        btn.layer.cornerRadius = 10;
        [btn sizeToFit];
        [[btn retain]autorelease];
        
        //btn.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        NSDictionary *item = [[items objectAtIndex:i] objectForKey:@"item"];
        //NSLog(@"Item %@",item);
        NSNumber *catId = [item valueForKey:@"catId"];
        NSString *categoryName = [item valueForKey:@"catName"];

        [btn setTitle:categoryName forState:UIControlStateNormal];
        [btn setTag: [catId intValue]];
        
        btn.frame = CGRectMake( self.view.frame.size.width/4, 120*i*0.5+30, self.view.frame.size.width/2, 30);
        self.btnCategory = btn;
        self.btnCategory.hidden = FALSE;
        
        [self.view addSubview:self.btnCategory];        
    }
    
    return self.btnCategory;
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    [self doLayoutForOrientation:toInterfaceOrientation];
    
    }

-(void) doLayoutForOrientation:(UIInterfaceOrientation)orientaion {
    if (UIInterfaceOrientationIsPortrait(orientaion)) {
        NSLog(@"Portrait mode");
        int y = 0;
        for(UIButton *btn in self.view.subviews){
            
            if(btn.tag >= 1){
                btn.frame = CGRectMake( self.view.frame.size.width/4, 120*y*0.5+30, self.view.frame.size.width/2, 30);
                y++;
            }
        }
    } else {
        NSLog(@"Landscape mode");
        int y = 0;
        int x = 0;
        
        for(UIButton *btn in self.view.subviews){
            
            if(btn.tag >= 1){

                if(btn.tag % 2 ){
                    x = 100;
                    btn.frame = CGRectMake( x, 100+y, self.view.frame.size.width/2, 30);
                    //NSLog(@"btn %d (%f, %f)", btn.tag, btn.frame.origin.x, btn.frame.origin.y);
                } else {
                    x= 500;
                    btn.frame = CGRectMake( x, 100+y, self.view.frame.size.width/2, 30);
                    //NSLog(@"btn %d (%f, %f)", btn.tag, btn.frame.origin.x, btn.frame.origin.y);
                    y += 50;
                }
            }
        }
    }
}

-(id)createProductLabel:(NSArray *)items withCategoryId:catId{
    int y = 0;
    for(int i=0; i < [items count]; i++){
        UILabel *labelProduct = [[UILabel alloc]init];
        labelProduct.frame = CGRectMake( 250, 100*y*.5+30, 210, 50);
        labelProduct.lineBreakMode = NSLineBreakByWordWrapping;
        //labelProduct.numberOfLines = 0;
        //[labelProduct sizeToFit];
        labelProduct.hidden = TRUE;
        [[labelProduct retain]autorelease];
        
        NSDictionary *item = [[items objectAtIndex:i] objectForKey:@"item"];
        
        NSNumber *prodCatId = [NSNumber numberWithInt:[[item valueForKey:@"cat_id"] intValue]];
        NSString *productName = [item valueForKey:@"prodName"];
        
        //NSLog(@"ProdCatId %@, productName %@", prodCatId, productName);
        //NSLog(@"Cat id %@ and prod id %@",catId, prodCatId);
        
        
        if (catId == prodCatId) {
            //NSLog(@"%@",productName);
            
            labelProduct.text = productName;
            self.lblProduct = labelProduct;
            self.lblProduct.hidden = FALSE;
            
            [self.view addSubview:labelProduct];
            y++;
        }
    }
    
    return self.lblProduct;
}

-(void)showCategoryPage{
    //NSLog(@"Btn \"Back\" was pressed!");
    for(UILabel *lbl in self.view.subviews){
            [lbl removeFromSuperview];
    }

    [self jsonParsingCategory:@"http://www.irinap.com/jsonws/categories.php"];
    //NSLog(@"%@",self.btnCategory);
    for(UIButton *btn in self.view.subviews){
        if(btn.tag == 0){
            [btn removeFromSuperview];
        }
    }
}

-(void)hideCategoryPage{
    
    for(UIButton *btn in self.view.subviews){
        if(btn.tag > 0){
            [btn removeFromSuperview];
        }
    }
    [self createBackBtn];
}

-(void)showProductPage:(UIButton *) sender {
    //NSLog(@"Btn \"show Category Page\" was pressed!");

    UIButton *someBtn = (UIButton *) sender;
    //NSLog(@"The button title is %@", someBtn.titleLabel.text);
    //NSLog(@"The button catId is %d", someBtn.tag);

    NSNumber * catId = [NSNumber numberWithInt:someBtn.tag];
    
    [self hideCategoryPage];
    [self jsonParsingProduct:@"http://www.irinap.com/jsonws/service.php" withCategoryId:catId];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)jsonParsingCategory:url{
    NSData *responseData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSError *err = nil;
    id result = nil;
    
    if(responseData !=nil){
        //JSON Parsing
        result = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&err];
        //NSLog(@"Result = %@",result);
        
        if(err) {
            NSLog(@"%@", [err localizedDescription]);
        }else{
            if([result isKindOfClass:[NSDictionary class]]){
                //extract specific value
                NSArray *items = [result objectForKey:@"items"];
                
                [self createCategoryBtn:items ];
            }
        }
    }

    return result;
}

-(id)jsonParsingProduct:url withCategoryId:catId{
    //Get request and response through URL
    NSData *responseData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSError *err = nil;
    id result = nil;
    
    if(responseData !=nil){
        //JSON Parsing
        result = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&err];
        //NSLog(@"Result = %@",result);
        
        if(err) {
            NSLog(@"%@", [err localizedDescription]);
        }else{
            if([result isKindOfClass:[NSDictionary class]]){
                //NSLog(@"Result is dictionary!");
                
                //extract specific value
                NSArray *items = [result objectForKey:@"items"];
                
                [self createProductLabel:items withCategoryId:catId];
            }
        }
        
    }

    return result;
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
    [_btnCategory release];
    [_btnBack release];
    [_lblProduct release];
    [super dealloc];
}

@end
