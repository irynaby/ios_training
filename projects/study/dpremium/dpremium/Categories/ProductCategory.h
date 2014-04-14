//
//  Categories.h
//  dpremium
//
//  Created by Admin on 18/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "ProductAction.h"


@interface ProductCategory : NSObject <ProductAction>

-(void) addProduct:(Product *)product;
-(void) removeProductWithId:(NSInteger)pid;
//-(Product*) findProductById:(NSInteger)pid;
-(ProductCategory*) sortedProductCategory:(NSArray*)categoryName;

@property (retain,nonatomic) NSNumber * categoryID;
@property (retain,nonatomic) NSString * categoryName;
@property (retain,nonatomic) NSArray * categoryProducts;

+(ProductCategory *) categoryWithName:(NSString *)name;

+(NSMutableArray *)createTestCategories;
-(void) createTestCategoryProducts;
@end
