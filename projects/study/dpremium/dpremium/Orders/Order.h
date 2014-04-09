//
//  Order.h
//  dpremium
//
//  Created by Admin on 18/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Customer.h"
@class Product;
@class Customer;

@interface Order : NSObject {
}

@property NSInteger numOrder;
@property NSDate * dateOrder;
@property NSInteger userId;
@property NSInteger productId;

//Methods
- (id) initOrder;
+ (void) doNumOrder : (NSInteger) numOrder
        andDate : (NSDate *) dateOrder
        andUser : (NSInteger) userId
        andProductId: (NSInteger) productId;
+ (void) deleteOrderByNumOrder : (NSInteger) numOrder;
- (void) processOrder;
@end
