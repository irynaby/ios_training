//
//  Customer.m
//  dpremium
//
//  Created by Admin on 18/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Customer.h"

@implementation Customer

@synthesize customerId = _customerIdVar;
@synthesize customerPhone = _customerPhoneVar;
@synthesize shippingAddress = _shippingAddressVar;
@synthesize userId = _userIdVar;

-(id) initCustomer{
    _customerIdVar = 0;
    _customerPhoneVar = 1234567;
    _shippingAddressVar =@"Milan, str. Franco, 3";
    _userIdVar = 1;
    
    return self;
}

-(void) deleteCustomerById : (NSInteger) customerId {
    NSLog(@"Customer with id %d had been deleted",_customerIdVar);
}

-(void) customerWithUserId : (NSInteger) userId
           andCustomerIs : (NSInteger) customerId
      andShippingAddress : (NSString *) shippingAddress
        andCustomerPhone : (NSInteger) customerPhone
{
    NSLog(@"Customer with id = %d :\n Shipping Address: %@ \n Phone: %d \n", _customerIdVar, _shippingAddressVar, _customerPhoneVar );
}
@end
