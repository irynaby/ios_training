//
//  Person.m
//  Lesson1
//
//  Created by Admin on 17/03/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Person.h"

void doSmthForMeGlobally(int i){
    NSLog(@"Globally! %d", i);
}

@implementation Person{
    
}

@synthesize firstName=_firstNameVariable;
//@synthesize lastName=_lastNameVariable;
//@synthesize age=_ageVariable;

+(Person*)personWithFirstName:(NSString*)firstName lastName:(NSString*)lastName{
    Person*retVal = [[Person alloc] init];
    //equals
    Person *retval = [Person new];
    
    Person *retnil = nil;
    
    if(retVal == nil){
        //1
    }
    
    if(retVal){
        //2
    }
    
    return retVal;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.firstName = @"<#string#>";
    }
    return self;
}

-(NSString*)description{
    //return @"My person";
    return [NSString stringWithFormat:@"Person: %@ %@ %d", _firstNameVariable, self.lastName, self.age];
}

-(void) saySimpleHello{
    NSLog(@"Hello!");
}

-(void) sayHelloWithWelcomWord : (NSString*)welcomWorld{
    NSLog(@"Hello!, %@", welcomWorld);
}

-(void) sayHelloWithWelcomWord :(NSString *)welcomWorld andTitle:(NSString *)title{
    //NSLog(@"Hello!, %@, %@", welcomWorld, title);
    [self sayHelloWithWelcomWord:@"Hello H!"];
    //objC_MsgSend(self, "sayHelloWithWelcomWorld:",@"Hello H!");
    NSLog(@"WOW!");
    doSmthForMeGlobally(5);
}
@end
