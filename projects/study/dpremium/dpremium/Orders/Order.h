//
//  Order.h
//  dpremium
//
//  Created by Admin on 18/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Customer.h"

@interface Order : Customer {
}

@property NSInteger numOrder;
@property NSDate * dateOrder;
@property NSInteger userId;

//Methods
- (id) initOrder;
- (void) doNumOrder : (NSInteger) numOrder
        andDate : (NSDate *) dateOrder
        andUser : (NSInteger) userId;
- (void) deleteOrderByNumOrder : (NSInteger) numOrder;
@end
