//
//  BNRItem.h
//  RandomItems
//
//  Created by MIGUEL ANGEL MORENO ARMENTEROS on 16/03/14.
//  Copyright (c) 2014 MIGUEL ANGEL MORENO ARMENTEROS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}

+(instancetype) randomItem;


//Designated initializer for the BNRItem
-(instancetype) initWithItemName:(NSString*)name
                  valueInDollars: (int) value
                    serialNumber: (NSString*) serialNumber;

-(instancetype) initWithName: (NSString*) name;


-(void) setItemName:(NSString*) str;
-(NSString*) itemName;

-(void) setSerialNumber:(NSString*) str;
-(NSString*) serialNumber;

-(void) setValueInDollars:(int) v;
-(int) valueInDollars;

-(NSDate*) dateCreated;


@end
