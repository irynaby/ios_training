//
//  Order.m
//  dpremium
//
//  Created by Admin on 18/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Order.h"

@implementation Order

@synthesize numOrder = _numOrderVar;
@synthesize dateOrder = _dateOrderVar;
@synthesize userId = _userIdVar;

- (id) initOrder{
    _numOrderVar = 123;
    _userIdVar = 1;
    
    return self;
}

- (void) deleteOrderByNumOrder : (NSInteger) numOrder {
    NSLog(@"Orders № %d had been deleted!",_numOrderVar);
}

- (void) doNumOrder : (NSInteger) numOrder
            andDate : (NSDate *) dateOrder
            andUser : (NSInteger) userId{
    NSLog(@"Do Order method");
    
}

@end
