//
//  Products.h
//  dpremium
//
//  Created by Admin on 18/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Products : NSObject{
    NSArray * _productTypes;
    NSMutableArray *_mutProductTypes;
}

@property (retain,nonatomic) NSArray * productTypes;
@property (retain,nonatomic) NSMutableArray * mutProductTypes;

-(void) createProductsTypes;
-(NSArray *) productTypes;
- (NSMutableArray *) mutProductTypes;
-(void) setProductTypes:(NSArray *)productTypes;

@end
