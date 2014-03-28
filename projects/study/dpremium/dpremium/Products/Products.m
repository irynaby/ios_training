//
//  Products.m
//  dpremium
//
//  Created by Admin on 18/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Products.h"

@implementation Products{}

@synthesize productTypes = _productTypes;
//@synthesize newProductTypes = _newProductTypes;
@synthesize mutProductTypes = _mutProductTypes;


-(void) createProductsTypes {
    _productTypes = [[NSArray alloc] initWithObjects:
                     @"Books", @"Health", @"Cell Phones",
                     @"Electronics", @"Home", @"Sports, Fitness & Outdoors",
                     @"Office", nil];
    
    //NSLog(@"%@", _productTypes);
    
    NSMutableArray * mutProductTypes = [NSMutableArray arrayWithArray:_productTypes];
}

- (NSArray *) productTypes {
    if([_productTypes count] > 0) {
        int i = 0;
        for( id eachObject in _productTypes){
        	NSLog(@"[%i] %@ ", i, eachObject);
            i++;
        }
    }
    
    return _productTypes;
}

- (NSMutableArray *) mutProductTypes {
    if([_mutProductTypes count] > 0) {
        int i = 0;
        for( id eachObject in _mutProductTypes){
        	NSLog(@"[%i] %@ ", i, eachObject);
            i++;
        }
    }
    
    return _mutProductTypes;
}

-(void) setProductTypes:(NSArray *)productTypes{
    @autoreleasepool {
        
        [productTypes retain];
        [_productTypes release];
        
        _productTypes = productTypes;
    }
}

-(void) dealloc {
    [_productTypes release];
    _productTypes = nil;
    //or
    self.mutProductTypes = nil;
    
    [super dealloc];
}


@end

