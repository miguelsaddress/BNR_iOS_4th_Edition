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
        

        BNRItem *backpack = [[BNRItem alloc] initWithName:@"Backpack"];
        BNRItem *calculator = [[BNRItem alloc] initWithName:@"Calculator"];
        [items addObject:backpack];
        [items addObject:calculator];
        
        backpack.containedItem = calculator;
        
        backpack = nil;
        calculator = nil;
        
        //Display the items
        for(BNRItem *item in items){
            NSLog(@"%@", item);
        }
        
        //freeing items
        NSLog(@"Setting items to nil...");
        items = nil;
        
    }
    return 0;
}

