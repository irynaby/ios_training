//
//  User.m
//  dpremium
//
//  Created by Admin on 18/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize userId = _userIdVar;
@synthesize userName = _userNameVar;
@synthesize userAddress = _userAddressVar;
@synthesize userBirthDate = _userBirthDateVar;

- (id)initUser {
    _userIdVar = 1;
    _userNameVar = @"Vasya Pushkin";
    _userAddressVar = @"Madrid, ave. Red, 12";
    _userBirthDateVar = @"2000-12-12";
    
    return self;
}

- (void) userWithName : (NSString *) userName
           andAddress : (NSString *) userAddress
         andBirthDate : (NSString *) userBirthDate
            andUserId : (NSInteger) userId {
    NSLog(@" %@ with id = %d :\n Address: %@ \n BirthDate: %@ \n", self.userName, self.userId, _userAddressVar, _userBirthDateVar);
}

- (void) deleteUserById : (NSInteger) userId {
    NSLog(@"User with id %d had been deleted!", _userIdVar);
}

@end
