//
//  main.m
//  Arrays
//
//  Created by Admin on 15/04/2014.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //=====  C Array
        //type name [size] = { value1, value2 ... valueN};
        int myArray1 [4] = { 1, 2, 3, 4};
        NSLog(@"%i",myArray1[2]);
        
        //Objective C Array
        //имяКласса *имяУказателя = [[выделение памяти] инициализация объекта]
        NSArray *myArray2 = [[NSArray alloc] initWithObjects:@"one",@"two", @"three", nil];
        NSLog(@"%@",[myArray2 objectAtIndex:2]);//вывод значения по индексу
        NSLog(@"%@",myArray2);//вывод всех эл-тов в массиве
        NSLog(@"%li",(unsigned long)[myArray2 count]);//количество объектов в массиве
        //Mutable Array
        NSMutableArray *myMutArray = [[NSMutableArray alloc] init];
        [myMutArray addObject:@"one"];
        [myMutArray addObject:@"two"];
        [myMutArray addObject:@"three"];
        [myMutArray addObject:@"four"];
        [myMutArray removeObjectAtIndex:2];
        NSLog(@"%@",myMutArray);//remove object
        //NSDictionary
        //имяКласса *имяУказателя = [[выделение памяти] инициализация объекта: значение1, ключ1, значение2, ключ2, nil]
        NSDictionary *myDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"one",@"key1",@"two",@"key2", nil];
        NSLog(@"%@",myDictionary);
        
    }
    return 0;
}

