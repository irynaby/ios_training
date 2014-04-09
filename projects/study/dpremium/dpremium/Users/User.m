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

//- (id)initUser {
//    self = [super init];
//    if (self) {
//        _userIdVar = 1;
//        _userNameVar = [@"Vasya Pushkin" retain];
//        _userAddressVar = [[NSString alloc] initWithString:@"Madrid, ave. Red, 12"];
//        _userBirthDateVar = [@"2000-12-12" retain];
//    }
//
//    return self;
//}

- (id) initWithName : (NSString *) userName
           andAddress : (NSString *) userAddress
         andBirthDate : (NSString *) userBirthDate
            andUserId : (NSInteger) userId {
   
    self = [self init];
    if (self) {
        _userIdVar = userId;
        _userNameVar = userName;
        _userAddressVar = userAddress;
        _userBirthDateVar = userBirthDate;
    }
    NSLog(@" %@ with id = %d :\n Address: %@ \n BirthDate: %@ \n", self.userName, self.userId, _userAddressVar, _userBirthDateVar);
    return self;
    
}

+(User *)userWithName : (NSString *) userName
         andAddress : (NSString *) userAddress
       andBirthDate : (NSDate *) userBirthDate
          andUserId : (NSInteger) userId{
    User *retVal = [[User alloc] initWithName:userName andAddress:userAddress andBirthDate:userBirthDate andUserId:userId];
    
    return [retVal autorelease];
}


+ (void) deleteUserById : (NSInteger) userId {
    NSLog(@"User with id %d had been deleted!", userId);
}

-(void) dealloc{
    //release your variables
    //[_userIdVar release];
    [_userNameVar release];
    [_userAddressVar release];
    [_userBirthDateVar release];
    
    [super dealloc];
}

@end
