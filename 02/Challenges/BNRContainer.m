//
//  BNRContainer.m
//  RandomItems
//
//  Created by MIGUEL ANGEL MORENO ARMENTEROS on 17/03/14.
//  Copyright (c) 2014 MIGUEL ANGEL MORENO ARMENTEROS. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

//Designated initializer
-(instancetype) initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)serialNumber
                        subitems: (NSArray*) subitems
{
    if( self=[super initWithItemName:name valueInDollars:value serialNumber:serialNumber] )
    {
        _subitems = subitems;
    }
    return self;
}

-(instancetype) initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)serialNumber
{
    return [self initWithItemName:name
                   valueInDollars:value
                     serialNumber:serialNumber
                         subitems:@[] ];
}

-(NSString *) description
{
    NSString *content = [NSString stringWithFormat:@"\nContains:\n%@", self.subitems];
    NSString *descriptionString = [[super description] stringByAppendingString:content];
    
    return descriptionString;
}

-(NSArray*) subitems{
    return _subitems;
}

-(int) valueInDollars
{
    int value = _valueInDollars;
    for (BNRItem *item in self.subitems) {
        value += item.valueInDollars;
    }
    return value;
}

@end
