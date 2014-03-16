//
//  main.m
//  RandomItems
//
//  Created by MIGUEL ANGEL MORENO ARMENTEROS on 16/03/14.
//  Copyright (c) 2014 MIGUEL ANGEL MORENO ARMENTEROS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        //Creating 10 random items
        for (int i=0; i<10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }
        
        //Display the items
        for(BNRItem *item in items){
            NSLog(@"%@", item);
        }
        
        //Testing Silver Challenge initializer
        BNRItem *it = [[BNRItem alloc] initWithName:@"The sofa" serialNumber:@"A36Y5"];
        NSLog(@"%@", it);
        
        it.valueInDollars = 1234;
        NSLog(@"%@", it);

        //freeing items
        items = nil;
        
    }
    return 0;
}

