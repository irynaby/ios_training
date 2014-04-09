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
@property (retain,nonatomic) NSString * userName;
@property (retain,nonatomic) NSString * userAddress;
@property (retain,nonatomic) NSString * userBirthDate;

//Methods

//- (id)initUser ;

+ (void) deleteUserById : (NSInteger) userId;

- (id) initWithName : (NSString *) userName
           andAddress : (NSString *) userAddress
           andBirthDate : (NSDate *) userBirthDate
           andUserId : (NSInteger) userId;

+(User *)userWithName : (NSString *) userName
         andAddress : (NSString *) userAddress
       andBirthDate : (NSDate *) userBirthDate
          andUserId : (NSInteger) userId;
@end
