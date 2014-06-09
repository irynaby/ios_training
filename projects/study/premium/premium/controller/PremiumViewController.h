//
//  PremiumViewController.h
//  premium
//
//  Created by Admin on 16/04/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductDetailViewController.h"

@interface PremiumViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    //UIButton *labelProduct;
    //UILabel *labelProduct;
    //UITableView * tableView;
    //NSMutableArray * list;
}

//@property (retain,nonatomic) UINavigationBar *navBar;
@property (retain,nonatomic) UIButton *btnCategory;
@property (retain,nonatomic) UIButton *btnBack;
@property (retain,nonatomic) UILabel *lblProduct;
@property (retain, nonatomic) UIActivityIndicatorView *activityIndicatorView;
@property (retain,nonatomic) UILabel *text;

@property (retain, nonatomic) NSMutableArray *list;
@property (retain, nonatomic) UITableView * tableView;
@property (retain, nonatomic) UILabel *sectionHeader;

@property (retain,nonatomic) NSDictionary *dictionary;
@property (retain,nonatomic) NSString *productName;
@property (retain,nonatomic) NSString *prodPrice;
@property (retain,nonatomic) NSString * prodDesc;
@property (retain, nonatomic) NSString * prodImage;

@property (retain, nonatomic) NSArray *indexTitlesArray;

@property (retain,nonatomic) UIBarButtonItem *createCategoryBtn;
@property (retain,nonatomic) UIBarButtonItem *createProductBtn;


//@property (retain,nonatomic) UIBarButtonItem *createCategoryBtn;
//@property (retain,nonatomic) UIBarButtonItem *createProductBtn;

//@property (retain, nonatomic) ProductDetailViewController *detailVC;

-(void)showCategoryPage;
-(void)showProductPage:(id) sender;
-(id)createBackBtn;

-(void)hideCategoryPage;

-(id)createCategoryBtn: (NSArray *)items;
-(id)createProductLabel:(NSArray *)items withCategoryId:catId;

-(id) createCategoryBtnItem;
-(id) createProductBtnItem;

-(id)jsonParsingCategory:url;
-(id)jsonParsingProduct:url withCategoryId:catId;

-(void) doLayoutForOrientation:(UIInterfaceOrientation)orientaion;

-(void) createActivityIndicator;

-(void)showCreateCategoryPage;
-(void)showCreateProductPage;

//-(void) createNavBar;

-(NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section;
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
-(void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath;

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView;

- (void) tableView: (UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndex toIndexPath:(NSIndexPath *)toIndex;
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath: (NSIndexPath *)indexPath;

@end
