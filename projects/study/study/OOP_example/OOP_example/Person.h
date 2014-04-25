//
//  Person.h
//  OOP_example
//
//  Created by Admin on 15/04/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    NSString *_name;
    NSInteger _age;
}
-(void)setName: (NSString *)name;
-(void)setAge: (NSInteger) age;
-(void) descriptionOfPerson;
@end
