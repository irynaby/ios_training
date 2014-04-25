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
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.categoryProducts];
    [tempArray addObject:product];
    self.categoryProducts = tempArray;
}

-(void) removeProductWithId:(NSInteger)pid{
    NSLog(@"Product with id %d remove", pid);
}

-(Product*) findProductById:(NSInteger)pid {
    NSLog(@"PRODUCTS ID is %d",pid);
    /*int i = 0;
    for (Product *product in ) {
        NSLog(@"product %@ with id %d", product.productName, product.productId);
        i++;
    }
     */
   //NSLog(@"product %@ with id %ld", pname, pid);
    return 0;
}

+(ProductCategory *)GiveMeBestCategory:(NSArray *)categories withComparator:(CategoryWithMoreProductsFinder)comparator{
    //Вызвать блок для каждых двух продуктов в массиве (как пузырьковая сортировка)
    //Найти самую большую категорию и ее вернуть

    ProductCategory *temp = nil;

    for(int i= 0; i < [categories count]; i++){
        for(int j = 0; j < [categories count]; j++){
            
            ProductCategory *cat1 =[categories objectAtIndex:i];
            ProductCategory *cat2 =[categories objectAtIndex:j];
            
            temp = cat1;
            cat1 = cat2;
            cat2 = temp;
            
            if(comparator(cat1,cat2) == FirstIsBest) {
                NSLog(@"The best categories is %@",cat1);
                return [[cat1 retain] autorelease];
            }
            else if (comparator(cat1,cat2) == SecondIsBest)
            {
                NSLog(@"The best categories is %@",cat2);
                return [[cat2 retain] autorelease];
            }
            else {
                NSLog(@"Are the best!");
                return nil;
            }
        }
    }
    
    NSLog(@"The best categories is %@", temp);
    return [[temp retain] autorelease];
}

-(NSArray*) sortedCategoryProducts {
    
    NSArray * sortedArray = [self.categoryProducts sortedArrayUsingComparator:^NSComparisonResult(Product *p1, Product *p2){
        
        return [p1.productSKU compare:p2.productSKU];
    }];
    
    NSLog(@"Sorted category: %@", sortedArray);
    return sortedArray;
}

+(NSArray *)createTestCategories{
    NSArray *names = [NSArray arrayWithObjects:@"Electronic",@"Home & Garden",@"Toys,Kids & Baby",@"Sports & Entertainment",@"Bags & Shoes",@"Books",@"Office",nil ];
    
    NSMutableArray *retVal = [NSMutableArray array];
    for (int i =0; i<[names count]; i++) {
        
        ProductCategory *category = [[ProductCategory alloc] init];
        category.categoryName = [names objectAtIndex:i];
        [retVal addObject:category];
        [category release];
        
    }    
    return retVal;
}

-(void) createTestCategoryProducts{
    Product *product = [[Product alloc] init];
    //add 10 products for all categories
    for (int i = 0; i < 10; i++) {
        /*Product *product = [[Product alloc] init];*/
        product.productName = [NSString stringWithFormat:@"Category %@ Product %d", self.categoryName, i];
        product.productSKU = [ProductCategory GUIDString];
        [self addProduct:product];
        NSLog(@"Category: %@ \n Product: %@ \n", self.categoryName, product);
        /*[product release];*/
    }
    
    [product release];
}

+(NSString*)GUIDString {
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return [(NSString *)string autorelease];
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