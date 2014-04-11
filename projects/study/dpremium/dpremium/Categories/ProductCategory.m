//
//  Categories.m
//  dpremium
//
//  Created by Admin on 18/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ProductCategory.h"

@implementation ProductCategory

@synthesize categoryProducts = _categoryProductsVar;


-(void) addProduct:(Product *)product{
    product.productCategory = self;
    NSLog(@"Product %@ had been added",product.productCategory);
}

-(void) removeProductWithId:(NSInteger)pid{
    NSLog(@"Product with id %d remove", pid);
}
/*
-(Product*) findProductById:(NSInteger)pid {
    int i = 0;
    for (Product *eachProduct in Product *pid) {
        NSLog(@"product with id %ld", pid);
        i++;
    }
   //NSLog(@"product %@ with id %ld", pname, pid);
    //return pname;
}
*/

+(NSArray *)createTestCategories{
    NSArray *names = [NSArray arrayWithObjects:@"Books",@"Home",@"Office",@"Electronic",@"Toys",nil ];
    
    NSMutableArray *retVal = [NSMutableArray array];
    for (int i =0; i<[names count]; i++) {
        
        ProductCategory *category = [[ProductCategory alloc] init];
        category.categoryName = [names objectAtIndex:i];
        [retVal addObject:category];
        //[category release];
    }
    
    return retVal;
}

-(void) createTestCategoryProducts{
    //add 10 products for all categories
    for (int i = 0; i < 10; i++) {
        Product *product = [[Product alloc] init];
        product.productName = [NSString stringWithFormat:@"Category %@ Product %d", self.categoryName,  i];
        [self addProduct:product];
        NSLog(@"Category: %@ \n Product: %@ \n", self.categoryName, product);
        [product release];
    }
}

+(ProductCategory *) categoryWithName:(NSString *)name{
    return [[[ProductCategory alloc] init] autorelease];
}

-(void) dealloc {
    [_categoryProductsVar release];
    _categoryProductsVar = nil;
    
    [super dealloc];
}

@end