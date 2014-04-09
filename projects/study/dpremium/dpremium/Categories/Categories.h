//
//  Categories.h
//  dpremium
//
//  Created by Admin on 18/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Products.h"

@interface Categories : NSObject {
    NSArray * _categoryProducts;
}

@property (retain,nonatomic) NSArray * productTypes;

-(void) addProduct:(Products *)product;
-(NSArray*) categoryProducts;
-(Products*) findProductById:(NSInteger)pid;

@end
