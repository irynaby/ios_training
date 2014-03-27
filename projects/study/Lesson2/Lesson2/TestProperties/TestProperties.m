//
//  TestProperties.m
//  Lesson2
//
//  Created by Admin on 24/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "TestProperties.h"

@implementation TestProperties{
    NSArray *_privateTempArray;
}

@synthesize productTypes = _productTypes;
//@synthesize newProductTypes = _newProductTypes;
@synthesize mutProductTypes = _mutProductTypes;


-(void) createProductsTypes {
    _productTypes = [[NSArray alloc] initWithObjects:
                     @"Books", @"Health", @"Cell Phones",
                     @"Electronics", @"Home", @"Sports, Fitness & Outdoors",
                     @"Office", nil];
    
    //NSLog(@"%@", _productTypes);
    
    
    //create copy array
    //NSArray * newProductTypes = [[NSArray alloc] initWithArray:_productTypes];
    //for price
    //NSNumber *num1 = [NSNumber numberWithFloat:10.0];
    //NSDecimalNumber *num2 = [NSDecimalNumber numberWithFloat:10.0];
    //NSLog(@"%@, %f",num1,[num2 floatValue]);
    
       
    NSMutableArray *mutProductTypes = [NSMutableArray arrayWithArray:_productTypes];
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
        //NSNumber *num1 = [[[NSNumber alloc] initWithFloat:10.0f] autorelease];
        //_privateTempArray = [[NSArray alloc] init];
        
        
        //NSError
        
        
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
