//
//  Person.h
//  Lesson1
//
//  Created by Admin on 17/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    //Instance variables
    @public
        NSInteger badAge;
        NSString* badFirstName;
        NSString* badLastName;
    @private
    @protected
    
}

@property NSString *firstName;
@property NSString *lastName;
@property NSInteger age;

-(id)initWithFirstName:(NSString*)firstName;

//Methods declaration
-(void) saySimpleHello;

//Parametrs
//Method name == [sayHelloWithWelcomWord : andTitle]
-(void) sayHelloWithWelcomWord : (NSString*)welcomWorld;
-(void) sayHelloWithWelcomWord :(NSString *)welcomWorld andTitle:(NSString *)title;
+(Person*)personWithFirstName:(NSString*)firstName lastName:(NSString*)lastName ;
@end
