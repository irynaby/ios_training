//
//  Customer.h
//  dpremium
//
//  Created by Admin on 18/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Customer : User {
}

@property NSInteger userId;
@property NSInteger customerId;
@property NSString * shippingAddress;
@property NSInteger customerPhone;
    
//Methods
-(id) initCustomer;
-(void) deleteCustomerById : (NSInteger) customerId;
-(void) customerWithUserId : (NSInteger) userId
           andCustomerIs : (NSInteger) customerId
           andShippingAddress : (NSString *) shippingAddress
           andCustomerPhone : (NSInteger) customerPhone;

@end
