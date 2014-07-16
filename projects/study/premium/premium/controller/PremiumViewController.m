//
//  PremiumViewController.m
//  premium
//
//  Created by Admin on 16/04/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "PremiumViewController.h"
#import "CreateCategoryViewController.h"
#import "CreateProductViewController.h"
#import "ProductDetailViewController.h"
#import "AboutViewController.h"

@interface PremiumViewController ()
    @property (retain) NSMutableArray* LCCategories;
@end

@implementation PremiumViewController

@synthesize btnCategory = _btnCategory;
@synthesize btnBack = _btnBack;
@synthesize lblProduct = _lblProduct;
@synthesize text = _text;
@synthesize list = _list;
@synthesize tableView = _tableView;
@synthesize createCategoryBtn = _createCategoryBtn;
@synthesize createProductBtn = _createProductBtn;
@synthesize prodImage = _prodImage;
@synthesize filteredList = _filteredList;
@synthesize alphabet = _alphabet;
@synthesize titleAlph = _titleAlph;
@synthesize rowContainer = _rowContainer;
@synthesize titleToBeDisplayed = _titleToBeDisplayed;

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
    
    
    UIApplication *app = [UIApplication sharedApplication];
    UIInterfaceOrientation currentOrientation = app.statusBarOrientation;
    [self doLayoutForOrientation:currentOrientation];
    
    [self createActivityIndicator];
    
    [NSThread detachNewThreadSelector:@selector(jsonParsingCategory:) toTarget:self withObject:@"http://secondstock.by/json/categories.php"];
    
    self.tableView = [[[UITableView alloc] initWithFrame: CGRectMake(200, 150, self.view.frame.size.width/2, self.view.frame.size.height/2) style:UITableViewStyleGrouped]autorelease];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = nil;
    
    //set the title of the navigation view
    [self.navigationItem setTitle:@"МАГАЗИН ОДЕЖДЫ"];
}

-(id) createCategoryBtnItem {
    UIButton *newCategoryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    newCategoryBtn.backgroundColor = [UIColor colorWithRed:224/255.0f green:155/255.0f blue:43/255.0f alpha:1.0f];
    newCategoryBtn.frame = CGRectMake(20, 30, 190, 30);
    [newCategoryBtn setTitle:@"Создать категорию" forState:UIControlStateNormal];
    newCategoryBtn.tintColor = [UIColor blackColor];
    newCategoryBtn.autoresizesSubviews = YES;
    newCategoryBtn.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin;
    [newCategoryBtn addTarget:self action:@selector(showCreateCategoryPage) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *createCategoryBtn = [[UIBarButtonItem alloc] initWithCustomView:newCategoryBtn];
    
    self.createCategoryBtn = createCategoryBtn;
    [createCategoryBtn release];
    
    return self.createCategoryBtn;
}

-(id) createProductBtnItem {
    
    UIButton *customBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    customBtn2.backgroundColor = [UIColor colorWithRed:224/255.0f green:155/255.0f blue:43/255.0f alpha:1.0f];
    customBtn2.frame = CGRectMake(20, 30, 170, 30);
    [customBtn2 setTitle:@"Создать продукт" forState:UIControlStateNormal];
    customBtn2.tintColor = [UIColor blackColor];
    customBtn2.autoresizesSubviews = YES;
    customBtn2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin;
    [customBtn2 addTarget:self action:@selector(showCreateProductPage) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *createProductBtn = [[UIBarButtonItem alloc] initWithCustomView:customBtn2];
    
    self.createProductBtn = createProductBtn;
    
    [createProductBtn release];
    return self.createProductBtn;
}

-(void)showCreateCategoryPage{
    NSLog(@"Create category Btn tap");
    CreateCategoryViewController *createCategoryVC = [[[CreateCategoryViewController alloc] init] autorelease];
    [self.navigationController pushViewController:createCategoryVC animated:YES];
    //[self presentViewController:createCategoryVC animated:YES completion:nil];
    if([self.btnCategory.currentTitle isEqualToString: @"РЕКЛАМА"]) {
        //self.btnCategory.hidden = YES;
        [self.btnCategory setTag:5];
        NSLog(@" btnCategory %@", self.btnCategory);
        [(UIButton *)[self.view viewWithTag:5] removeFromSuperview];
    }
}

-(void)showCreateProductPage{
    NSLog(@"Create product Btn tap");
    CreateProductViewController *createProductVC = [[[CreateProductViewController alloc] init] autorelease];
    //[self presentViewController:createProductVC animated:YES completion:nil];
    [self.navigationController pushViewController:createProductVC animated:YES];
}

-(void)createActivityIndicator {
    /*Add activity indicator*/
        self.activityIndicatorView = [[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray]autorelease];
        self.activityIndicatorView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    
        [self.view addSubview: self.activityIndicatorView];
        [self.activityIndicatorView startAnimating];
    
    /*Text "Loading..."*/
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 30, self.view.frame.size.height/2 + 30, 130, 30)];
    text.backgroundColor = [UIColor clearColor];
    text.textColor = [UIColor grayColor];
    text.font = [UIFont systemFontOfSize:14];
    text.text = @"Загрузка...";
    [[text retain]autorelease];
    
    self.text = text;
    [self.view addSubview:self.text];
}


-(id)createBackBtn{
    UIFont *buttonFont = [UIFont fontWithName:@"Geneva" size:17.0];
    UIColor *buttonColorBackgroundDefault = [UIColor colorWithRed:0.82 green:0.643 blue:0.639 alpha:1.0];
    
    UIButton *buttonBack = [[UIButton alloc] initWithFrame:CGRectMake(50, 70, 150, 30)];
    [buttonBack setShowsTouchWhenHighlighted:TRUE];
    [buttonBack addTarget:self action:@selector(showCategoryPage) forControlEvents:UIControlEventTouchDown];
    [buttonBack setTitle:@"Категории" forState:UIControlStateNormal];
    [buttonBack.titleLabel setFont:buttonFont];
    buttonBack.backgroundColor = buttonColorBackgroundDefault;
    buttonBack.layer.cornerRadius = 10;
    [[buttonBack retain]autorelease];

    self.btnBack = buttonBack;
    [self.view addSubview:buttonBack];
    
    return self.btnBack;
}

-(id)createCategoryBtn:(NSArray *)items{

    [self.activityIndicatorView stopAnimating];
    [self.activityIndicatorView removeFromSuperview];
    [self.text removeFromSuperview];
    
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
        
        NSDictionary *item = [[items objectAtIndex:i] objectForKey:@"item"];
        //NSLog(@"Item %@",item);
        //NSNumber *catId = [item valueForKey:@"catId"];
        //NSString *categoryName = [item valueForKey:@"catName"];
        NSNumber *catId = [item valueForKey:@"secid"];
        NSString *categoryName = [item valueForKey:@"secname"];
        
           [btn setTitle:categoryName forState:UIControlStateNormal];
           [btn setTag: [catId intValue]];
        
        
        btn.frame = CGRectMake( self.view.frame.size.width/4, 120*i*0.5+70, self.view.frame.size.width/2, 30);
        self.btnCategory = btn;
        
        

        
        self.btnCategory.hidden = FALSE;
        
        [self.view addSubview:self.btnCategory];        
    }
    
    
    return self.btnCategory;
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                        duration:(NSTimeInterval)duration{
    
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
/*
-(id)createProductLabel:(NSArray *)items withCategoryId:catId{
    int y = 0;
    for(int i=0; i < [items count]; i++){
        UILabel *labelProduct = [[UILabel alloc]init];
        labelProduct.frame = CGRectMake( 250, 100*y*.5+60, 210, 50);
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
*/
-(id)createProductLabel:(NSArray *)items
     withCategoryId:catId{
    self.list = [[NSMutableArray alloc] init];
    
    int y = 0;
    for(int i=0; i < [items count]; i++) {
        
        NSDictionary *item = [[items objectAtIndex:i] objectForKey:@"item"];
        NSNumber *prodCatId = [NSNumber numberWithInt:[[item valueForKey:@"secid"] intValue]];
        //NSString *productName = [item valueForKey:@"prodName"];
        //NSDecimalNumber *prodPrice = [NSDecimalNumber decimalNumberWithString:[item valueForKey:@"prodPrice"]];
        //NSString * prodDesc = [item valueForKey:@"prodDesc"];
        
        if (catId == prodCatId) {
            
            [self.list addObject:item];
            y++;
        }
        
    }
    //NSLog(@"List items %@",self.list);
    //NSLog(@"Count of lists = %lu",(unsigned long)[self.list count]);
    self.filteredList = [[NSMutableArray alloc] initWithCapacity:[self.list count]];
    [self.filteredList sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];//will sort array in ascending
    [self.filteredList addObjectsFromArray:self.list];    

    return self.filteredList;
}

-(NSMutableArray *)createAlphabet {
    NSMutableArray * alphabet = [[[NSMutableArray alloc] initWithCapacity:0]autorelease];
    for(int i =0; i <self.filteredList.count; i++) {
        NSString *firstLetter = [[[self.filteredList objectAtIndex:i] valueForKey:@"name"] substringToIndex:1];//modifying the statement to first letter
       
        NSData *data = [firstLetter dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        NSString * newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        if(![alphabet containsObject:newStr]){//checking already modified array
            [alphabet addObject:newStr];
        }
    }
    self.alphabet = alphabet;
    [self.alphabet sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];//sorting array in ascending
    //NSLog(@"Alphabet : %@", alphabet);
    return self.alphabet;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSMutableArray *) getArrayOfRowsForSection: (NSInteger)section {
    NSString *rowTitle;
    NSString *sectionTitle;
    NSMutableArray * rowContainer = [[[NSMutableArray alloc]initWithCapacity:0]autorelease];
    for (int i = 0; i < self.alphabet.count; i++) {
        if(section == i){//check right section
            sectionTitle = [self.alphabet objectAtIndex:i];//get section title
            
            for(NSString *title in [self.filteredList valueForKey:@"name"]) {
                rowTitle = [title substringToIndex:1];//for first alphabet
                
                if([rowTitle isEqualToString:sectionTitle]){
                    [rowContainer addObject:title];
                }
            }            
        }
    }
    self.rowContainer = rowContainer;
    return self.rowContainer;
}

-(NSInteger)tableView:(UITableView *) tableView
            numberOfRowsInSection:(NSInteger)section {
    NSLog(@"table view count is %lu", (unsigned long)[self.rowContainer count]);
    self.rowContainer = [self getArrayOfRowsForSection:section];
    //if([self.rowContainer count] == 0){return 1;}
    return [self.filteredList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
                    cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"LOAD CELL");
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier]autorelease];
    }
    
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    /*
    cell.textLabel.text = [self titleForRow:indexPath];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping; //enabling word wraping of text
    cell.textLabel.numberOfLines = 0;
    */
    //NSLog(@"IndexPath row = %ld and list count = %lu",(long)indexPath.row,(unsigned long)[self.list count]);
    if(indexPath.row < [self.filteredList count]){
        NSDictionary *dictionary = [self.filteredList objectAtIndex:indexPath.row];
        NSString *productName = [dictionary valueForKey:@"name"];
        NSString *prodPrice = [dictionary valueForKey:@"price"];
        NSString * prodDesc = [dictionary valueForKey:@"desc"];
        NSString * prodImage = [dictionary valueForKey:@"pic_small"];
        
        self.prodImage = [NSString stringWithFormat:@"http://secondstock.by/img_sh/%@",prodImage];
        self.prodDesc = prodDesc;
        self.prodPrice = [NSString stringWithFormat:@"%@ бел.руб.", prodPrice];
        self.productName = productName;
        self.dictionary = dictionary;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), ^{
            //Code in background
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.prodImage]];
            UIImage *pic = [UIImage imageWithData:imageData];
            dispatch_async(dispatch_get_main_queue(), ^{
                //code for main thread
                cell.imageView.image = pic;
                [cell setNeedsLayout];
            });
         
        });
        cell.textLabel.text = [self titleForRow:indexPath];
        NSLog(@"cell.textLabel.text %@", cell.textLabel.text);
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping; //enabling word wraping of text
        //cell.textLabel.text = productName;
        cell.detailTextLabel.text = self.prodPrice;
        //[self createAlphabet];
        
    }else{
        cell.textLabel.text = @"Добавить предмет";
        cell.textLabel.textColor = [UIColor blueColor];
        cell.editingAccessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.text = @"";
    }

    //created selected color for row
    UIView *bgColorView = [[[UIView alloc]init]autorelease];
    bgColorView.backgroundColor = [UIColor yellowColor];
    cell.selectedBackgroundView = bgColorView;
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    //[self.tableView autorelease];
    
    return cell;
}
/*
-(UIView *) tableView:(UITableView *)tableView
            viewForHeaderInSection:(NSInteger)section {
    //NSLog(@"Calling view for header");
    //create label
    UILabel *sectionHeader = [[[UILabel alloc] initWithFrame:CGRectZero]autorelease];
    sectionHeader.backgroundColor = [UIColor clearColor];
    sectionHeader.textAlignment = NSTextAlignmentCenter;
    sectionHeader.font = [UIFont boldSystemFontOfSize:15];
    sectionHeader.textColor = [UIColor brownColor];
    sectionHeader.highlightedTextColor = [UIColor yellowColor];
    sectionHeader.text = @"Выберите предмет из списка:";
    
    //NSLog(@"Section #%ld name - %@",(long)section, sectionHeader.text);

    //create header view and add sectionHeader as a subview
    //UIView *headerView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)]autorelease];
    
    //[headerView addSubview:sectionHeader];
    return sectionHeader;
}
*/
-(CGFloat) tableView:(UITableView *)tableView
           heightForHeaderInSection:(NSInteger)section {
    return 30;
}
/*
 
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if(cell.selected){
        NSUInteger row = [indexPath row];
        NSString * rowValue = [self.list objectAtIndex:row];
        NSString * msg = [[NSString alloc] initWithFormat:@"U selected %@", rowValue];
        UIAlertView * msgAlert = [[UIAlertView alloc] initWithTitle:@"Row selected" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [msgAlert show];
    }
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
 
}
 */
/*
-(void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    //NSUInteger row = [indexPath row];
    //NSString * rowValue = [self.list objectAtIndex:row];

     //NSString * msg = [[[NSString alloc] initWithFormat:@"U selected %@", rowValue]autorelease];
     //UIAlertView * msgAlert = [[[UIAlertView alloc] initWithTitle:@"Description" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]autorelease];
     //[msgAlert show];

    
    //ProductDetailViewController *detailVC = [[[ProductDetailViewController alloc]init] autorelease];
    //[self presentViewController:detailVC animated:YES completion:nil];
    //[self.navigationController pushViewController:detailVC animated:YES];
    
}
*/
-(void) tableView: (UITableView *) tableView
        accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    [self tableView:tableView didSelectRowAtIndexPath:indexPath];
}

-(void)tableView:(UITableView *)tableView
       didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"didSelectRowAtIndexPath call - %@",dictionary);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    ProductDetailViewController *detailVC = [[[ProductDetailViewController alloc]init] autorelease];
    detailVC.product = [self.filteredList objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
    //[self presentViewController:detailVC animated:YES completion:nil];
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated {
    //NSLog(@"Set edit mode for table!");
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
    [self.tableView reloadData];
}

-(BOOL)tableView:(UITableView *)tableView
       canEditRowAtIndexPath: (NSIndexPath *)indexPath {
    //NSLog(@"Can edit row in section %ld",(long)indexPath.section);
    /*
    if (indexPath.section == 0) {
        return NO;
    }
    */
    return YES;
}

- (void)tableView:(UITableView *)tableView
        commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
        forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [tableView beginUpdates];
            /*
            UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Delete"
                              message: @"Действительно хотите удалить эту вещь?"
                              delegate: self
                              cancelButtonTitle: @"Нет"
                              otherButtonTitles: @"Конечно", nil];
            [alert show];
            [alert release];
             */
            //Delete the row from the dataSource
        	[self.filteredList removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];

	}else if (editingStyle == UITableViewCellEditingStyleInsert){
        
         [tableView beginUpdates];
            [self showCreateProductPage];
         [tableView endUpdates];    }
}
/*
-(void) alertView: (UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 0) {
        NSLog(@"Cliked button No");
    }else if(buttonIndex == 1) {
        NSLog(@"Clicked button Yes");
    }
}
*/
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
                               editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row < [self.filteredList count]){
        return UITableViewCellEditingStyleDelete;
    }
    return UITableViewCellEditingStyleInsert;
}

- (BOOL)tableView:(UITableView *)tableView
        shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

-(void)tableView:(UITableView *)tableView
       moveRowAtIndexPath: (NSIndexPath *)sourceIndexPath
       toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    [self.filteredList insertObject: [self.filteredList objectAtIndex:sourceIndexPath.row] atIndex:destinationIndexPath.row];
    [self.filteredList removeObjectAtIndex:(sourceIndexPath.row + 1)];
    
}

-(BOOL)tableView:(UITableView *)tableView
       canMoveRowAtIndexPath: (NSIndexPath *)indexPath {
    //NSLog(@"Can move row at indexPath %ld", (long)indexPath.row);
    
    //Don't move the first row
    if (indexPath.row == 0) {
        return NO;
    }
    
    return YES;
}

-(NSIndexPath *)tableView:(UITableView *)tableView
                targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath
                toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    
    if (proposedDestinationIndexPath.row == [self.filteredList count]) {
        return sourceIndexPath;
    }
    
    return proposedDestinationIndexPath;
}

-(void)showCategoryPage{
    //NSLog(@"Btn \"Back\" was pressed!");
    
    for(UILabel *lbl in self.view.subviews){
            [lbl removeFromSuperview];
    }

    [NSThread detachNewThreadSelector:@selector(jsonParsingCategory:) toTarget:self withObject:@"http://secondstock.by/json/categories.php"];
    //NSLog(@"%@",self.btnCategory);
    for(UIButton *btn in self.view.subviews){
        if(btn.tag == 0){
            [btn removeFromSuperview];
        }
    }
    [self.tableView removeFromSuperview];
    [self createCategoryBtnItem];
    self.navigationItem.leftBarButtonItem = self.createCategoryBtn;
}

-(void)hideCategoryPage{
    
    for(UIButton *btn in self.view.subviews){
        if(btn.tag > 0){
            [btn removeFromSuperview];
        }
    }
    [self createBackBtn];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self createProductBtnItem];
    self.navigationItem.leftBarButtonItem = self.createProductBtn;
}

-(void)showProductPage:(UIButton *) sender {
    //NSLog(@"Btn \"show Category Page\" was pressed!");
    
    UIButton *someBtn = (UIButton *) sender;
    //NSLog(@"The button title is %@", someBtn.titleLabel.text);
    //NSLog(@"The button catId is %d", someBtn.tag);

    NSNumber * catId = [NSNumber numberWithInt:someBtn.tag];
    
    [self hideCategoryPage];
    [self jsonParsingProduct:@"http://secondstock.by/json/service.php" withCategoryId:catId];
    //NSDictionary *extraParams = [NSDictionary dictionaryWithObjectsAndKeys:@"http://secondstock.by/json/service.php", catId, nil];
    //[NSThread detachNewThreadSelector:@selector(jsonParsingProduct:withCategoryId:) toTarget:self withObject: extraParams];
    //[self.navigationController pushViewController:self.tableView animated:YES];
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)jsonParsingCategory:url{
    @autoreleasepool {
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
                
                    [self performSelectorOnMainThread:@selector(createCategoryBtn:) withObject:items waitUntilDone:NO];
                }
            }
        }
    
        return result;
    }
}

-(id)jsonParsingProduct:url withCategoryId:catId{
    //Get request and response through URL
    @autoreleasepool {
        
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
                    //[self performSelectorOnMainThread:@selector(createProductLabel:withCategoryId:) withObject:[NSMutableArray arrayWithObjects:items, catId, nil] waitUntilDone:NO];
                    
                }
            }
        }
        return result;
    }
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    [self createAlphabet];
    return self.alphabet;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    //to set title for each section
    NSString * titleAlph;
    
    for(int i = 0; i < self.alphabet.count; i++) {
        if(section == i){
            titleAlph = [self.alphabet objectAtIndex:i];
        }
    }
    self.titleAlph = titleAlph;
    return self.titleAlph;
}

-(NSString *)titleForRow:(NSIndexPath *)indexpath {
    //NSMutableArray *rowArray = [[NSMutableArray alloc] initWithCapacity:0];
    //rowArray = [self getArrayOfRowsForSection:indexpath.section];

    [self getArrayOfRowsForSection:indexpath.section];
    NSString * titleToBeDisplayed = [self.rowContainer objectAtIndex:indexpath.section];
    NSLog(@"Title for row is %@ for %ld",titleToBeDisplayed, (long)indexpath.section);
    self.titleToBeDisplayed = titleToBeDisplayed;

    return self.titleToBeDisplayed;
}

/*
//return the index for the given section title
-(NSInteger)tableView:(UITableView *)tableView
            sectionForSectionIndexTitle:(NSString *)title
            atIndex:(NSInteger)index {
    
    
    return [self.rowContainer indexOfObject:title];
}
*/

-(void)dealloc{
    [_btnCategory release];
    [_btnBack release];
    [_lblProduct release];
    [_text release];
    [_list release];
    [_tableView release];
    [_createCategoryBtn release];
    [_createProductBtn release];
    [_prodImage release];
    [_filteredList release];
    [_alphabet release];
    [_titleAlph release];
    [_rowContainer release];
    [_titleToBeDisplayed release];
    
    [super dealloc];
}

@end
