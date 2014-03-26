//
//  BRNHypnosisViewController.m
//  HypnoNerd
//
//  Created by MIGUEL ANGEL MORENO ARMENTEROS on 26/03/14.
//  Copyright (c) 2014 MIGUEL ANGEL MORENO ARMENTEROS. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

-(void) loadView{
    
    BNRHypnosisView *hv = [[BNRHypnosisView alloc] init];
    self.view = hv;
}

@end
