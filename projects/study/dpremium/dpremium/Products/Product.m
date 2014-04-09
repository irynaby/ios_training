//
//  Products.m
//  dpremium
//
//  Created by Admin on 18/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Product.h"
#import "ProductCategory.h"

@implementation Product

/*@dynamic productCategory;

-(ProductCategory *)getProductCategory{
    
}

-(void)setProductCategory:(ProductCategory*)category{
    _productCategory = category;
    [category addProduct:self];
}*/


-(id) initWithId:(NSInteger)pid andName:(NSString *)pname {
    self = [self init];
    if (self) {
        _pidVar = pid;
        _pnameVar = pname;
    }
    NSLog(@" %@ with id = %d :\n ", _pnameVar, pid);
    return self;
}

+(Product*)productWithId:(NSInteger)pid andName:(NSString*)pname{
        Product *retVal = [[Product alloc] initWithId:pid andName:pname];
        return [retVal autorelease];
}

-(void) dealloc {
    [_pnameVar release];
    _pnameVar = nil;
    
    [super dealloc];
}


@end

