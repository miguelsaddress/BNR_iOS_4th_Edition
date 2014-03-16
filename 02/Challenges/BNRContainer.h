//
//  BNRContainer.h
//  RandomItems
//
//  Created by MIGUEL ANGEL MORENO ARMENTEROS on 17/03/14.
//  Copyright (c) 2014 MIGUEL ANGEL MORENO ARMENTEROS. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem
{
    NSArray *_subitems;
}

//Designated initializer
-(instancetype) initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)serialNumber
                        subitems: (NSArray*) subitems;

-(NSArray*) subitems;

@end
