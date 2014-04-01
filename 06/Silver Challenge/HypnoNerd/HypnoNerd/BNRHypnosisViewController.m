//
//  BRNHypnosisViewController.m
//  HypnoNerd
//
//  Created by MIGUEL ANGEL MORENO ARMENTEROS on 26/03/14.
//  Copyright (c) 2014 MIGUEL ANGEL MORENO ARMENTEROS. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController()
@property(nonatomic, weak) BNRHypnosisView *backgroundView;
@end

@implementation BNRHypnosisViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.tabBarItem.title = @"Hypnotize me";
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = i;
    }
    return self;
}

-(void) loadView{
    
    BNRHypnosisView *hv = [[BNRHypnosisView alloc] init];
    self.view = hv;
    self.backgroundView = hv;
    [self addSegmentedControl];

}

-(void) addSegmentedControl
{
    NSArray *itemArray = @[@"Red", @"Green", @"Blue"];
    UISegmentedControl *sc = [[UISegmentedControl alloc] initWithItems:itemArray];
    float x,y,width, height;
    x = self.view.frame.origin.x;
    y = self.view.frame.origin.y + 380;
    width = 320;
    height = 50;
    sc.frame = CGRectMake(x, y, width, height);
    sc.backgroundColor = [UIColor whiteColor];
    [sc addTarget:self
           action:@selector(pickOne:)
 forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:sc];

}

-(void) pickOne:(id)sender{
    UISegmentedControl *sc = (UISegmentedControl *)sender;
    NSString *selected = [sc titleForSegmentAtIndex: [sc selectedSegmentIndex]];

    UIColor *color;

    if( [selected isEqualToString:@"Red"] ){
        color = [UIColor redColor];
    }else if ( [selected isEqualToString:@"Green"] ){
        color = [UIColor greenColor];
    }else if ( [selected isEqualToString:@"Blue"] ){
        color = [UIColor blueColor];
    }
    
    self.backgroundView.circleColor = color;

    [self addSegmentedControl];
}

@end
