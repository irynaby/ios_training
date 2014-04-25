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

typedef enum : NSUInteger {
    FirstIsBest,
    SecondIsBest,
    AreEqual
} ComparatorResult;

typedef NSComparisonResult(^NSComparator)(id obj1, id obj2);

typedef ComparatorResult (^CategoryWithMoreProductsFinder)(ProductCategory *obj1, ProductCategory *obj2);

@interface ProductCategory : NSObject <ProductAction>

-(void) addProduct:(Product *)product;
-(void) removeProductWithId:(NSInteger)pid;
//-(Product*) findProductById:(NSInteger)pid;
-(NSArray*) sortedCategoryProducts;

@property (retain,nonatomic) NSNumber * categoryID;
@property (retain,nonatomic) NSString * categoryName;
@property (retain,nonatomic) NSArray * categoryProducts;

+(ProductCategory *) categoryWithName:(NSString *)name;

+(NSMutableArray *)createTestCategories;
+(NSString*)GUIDString;
+(ProductCategory *)GiveMeBestCategory:(NSArray *)categories withComparator:(CategoryWithMoreProductsFinder)comparator;

-(void) createTestCategoryProducts;

@end
