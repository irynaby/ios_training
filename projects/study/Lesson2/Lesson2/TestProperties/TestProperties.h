//
//  TestProperties.h
//  Lesson2
//
//  Created by Admin on 24/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestProperties : NSObject{
    NSArray * _productTypes;
    //NSArray * newProductTypes;
    NSMutableArray *_mutProductTypes;    
}

@property (retain,nonatomic) NSArray * productTypes;
@property (retain,nonatomic) NSMutableArray * mutProductTypes;

-(void) createProductsTypes;
-(NSArray *) productTypes;
- (NSMutableArray *) mutProductTypes;
-(void) setProductTypes:(NSArray *)productTypes;

@end
