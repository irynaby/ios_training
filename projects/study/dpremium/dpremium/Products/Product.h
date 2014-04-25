//
//  Products.h
//  dpremium
//
//  Created by Admin on 18/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ProductCategory;

@interface Product : NSObject{
    NSInteger _pidVar;
    NSString *_pnameVar;
}

@property (assign,nonatomic) NSInteger productId;
@property (copy,nonatomic) NSString *productName;
@property (copy,nonatomic) NSString *productSKU;
//@property (assign,nonatomic, getter = getProductCategory, setter = setProductCategory) ProductCategory * productCategory;
@property (assign,nonatomic) ProductCategory * productCategory;

-(id) initWithId:(NSInteger)pid andName:(NSString *)pname;
+(Product*)productWithId:(NSInteger)pid andName:(NSString*)pname;

@end
