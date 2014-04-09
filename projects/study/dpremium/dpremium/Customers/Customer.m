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
    self = [self init];
    
    if (self) {
    _customerIdVar = 0;
    _customerPhoneVar = 1234567;
    _shippingAddressVar =@"Milan, str. Franco, 3";
    _userIdVar = 1;
    }
    return self;
}

-(void) deleteCustomerById : (NSInteger) customerId {
    NSLog(@"Customer with id %ld had been deleted",_customerIdVar);
}

-(id) initWithUserId : (NSInteger) userId
           andCustomerId : (NSInteger) customerId
      andShippingAddress : (NSString *) shippingAddress
        andCustomerPhone : (NSInteger) customerPhone
{
    self = [self init];
    if (self) {
        _userIdVar = userId;
        _customerIdVar = customerId ;
        _shippingAddressVar = shippingAddress;
        _customerPhoneVar = customerPhone;
    }

    NSLog(@"Customer with id = %ld :\n Shipping Address: %@ \n Phone: %ld \n", _customerIdVar, _shippingAddressVar, _customerPhoneVar );
    return self;
}

+(Customer *) customerWithUserId : (NSInteger) userId
               andCustomerId : (NSInteger) customerId
          andShippingAddress : (NSString *) shippingAddress
            andCustomerPhone : (NSInteger) customerPhone
{
    Customer *retVal = [[Customer alloc] initWithUserId:userId andCustomerId:customerId andShippingAddress:shippingAddress andCustomerPhone:customerPhone];
    
    return [retVal autorelease];
}

-(void) dealloc{
    //release your variables
    [_customerIdVar release];
    [_shippingAddressVar release];
    [_customerPhoneVar release];
    [super dealloc];
}

@end
