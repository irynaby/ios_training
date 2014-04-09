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
@synthesize productId = _productIdVar;

- (id) initOrder{
    _numOrderVar = 123;
    _userIdVar = 1;
    _productIdVar = 1;
    
    return self;
}

+ (void) deleteOrderByNumOrder : (NSInteger) numOrder {
    NSLog(@"Orders № %d had been deleted!", numOrder);
}

- (id) initNumOrder : (NSInteger) numOrder
            andDate : (NSDate *) dateOrder
            andUser : (NSInteger) userId
        andProductId: (NSInteger) productId{
    
    self = [self init];
    if (self) {
        _userIdVar = userId;
        _numOrderVar = numOrder;
        _dateOrderVar = dateOrder;
        _productIdVar = productId;
    }
    NSLog(@" Order Date: %@ , # %d \n", _dateOrderVar,_numOrderVar);
    return self;
    
}


+ (Order *) initNumOrder : (NSInteger) numOrder
            andDate : (NSDate *) dateOrder
            andUser : (NSInteger) userId
            andProductId: (NSInteger) productId{
    
    Order *retVal = [[Order alloc] initNumOrder:numOrder andDate:dateOrder andUser:userId andProductId:productId];
    
    return [retVal autorelease];
    
}

- (void)processOrder {
    NSLog(@"Process order");
}

-(void) dealloc{
    //release your variables
    [_dateOrderVar release];
    [super dealloc];
}
@end
