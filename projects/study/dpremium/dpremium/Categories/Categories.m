//
//  Categories.m
//  dpremium
//
//  Created by Admin on 18/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Categories.h"

@implementation Categories

@synthesize categoryProducts = _categoryProductsVar;

-(void) addProduct:(Products *)product{
    //add to arry
    product.productCategory = self;
}


-(NSArray*) categoryProducts{
    if([_categoryProductsVar count] > 0) {
        int i = 0;
        for( id eachObject in _categoryProductsVar){
        	NSLog(@"[%i] %@ ", i, eachObject);
            i++;
        }
    }
    
    return _categoryProductsVar;

}

-(void) createCategoryProducts {
    _categoryProductsVar = [[NSArray alloc] initWithObjects:
                     @"Books", @"Health", @"Cell Phones",
                     @"Electronics", @"Home", @"Sports, Fitness & Outdoors",
                     @"Office", nil];
    
    //NSLog(@"%@", _categoryProduct);
}


-(Products*) findProductById:(NSInteger)pid{
    for (<#initialization#>; <#condition#>; <#increment#>) {
        <#statements#>
    }
}


@end
