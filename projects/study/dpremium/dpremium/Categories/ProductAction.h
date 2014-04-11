//
//  ProductAction.h
//  dpremium
//
//  Created by Admin on 10/04/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProductAction <NSObject>
@required
-(void) addProduct:(Product *)product;
-(void) removeProductWithId:(NSInteger)pid;
//@optional
//-(Product*) findProductById:(NSInteger)pid;
@end
