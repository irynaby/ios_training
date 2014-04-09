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
@property(retain,nonatomic) NSString * shippingAddress;
@property NSInteger customerPhone;
    
//Methods
-(id) initCustomer;
+(void) deleteCustomerById : (NSInteger) customerId;
-(id) initWithUserId : (NSInteger) userId
           andCustomerId : (NSInteger) customerId
           andShippingAddress : (NSString *) shippingAddress
           andCustomerPhone : (NSInteger) customerPhone;


+(Customer *) customerWithUserId : (NSInteger) userId
               andCustomerId : (NSInteger) customerId
          andShippingAddress : (NSString *) shippingAddress
            andCustomerPhone : (NSInteger) customerPhone;

@end
