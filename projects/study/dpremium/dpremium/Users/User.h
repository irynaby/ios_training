//
//  User.h
//  dpremium
//
//  Created by Admin on 18/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject{
}

@property NSInteger userId;
@property NSString * userName;
@property NSString * userAddress;
@property NSString * userBirthDate;

//Methods
- (id) initUser;
- (void) deleteUserById : (NSInteger) userId;

- (void) userWithName : (NSString *) userName
           andAddress : (NSString *) userAddress
           andBirthDate : (NSString *) userBirthDate
           andUserId : (NSInteger) userId;
@end
