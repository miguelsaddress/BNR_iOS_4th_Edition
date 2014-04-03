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
@property(nonatomic, weak) UISegmentedControl *segmentedControl;
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
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    BNRHypnosisView *hv = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    self.view = hv;
    self.backgroundView = hv;
    [self addSegmentedControl];

}

-(void) addSegmentedControl
{
    NSArray *itemArray = @[@"Red", @"Green", @"Blue"];
    UISegmentedControl *sc = [[UISegmentedControl alloc] initWithItems:itemArray];
    self.segmentedControl = sc;
    
    [self setFrameToSegmentedControl];
    self.segmentedControl.backgroundColor = [UIColor whiteColor];
    [self.segmentedControl addTarget:self
                              action:@selector(pickOne:)
                    forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.segmentedControl];

}

-(void) setFrameToSegmentedControl
{
    float x,y,width, height;
    CGRect backGroundViewFrame = self.backgroundView.frame;
    
    x = backGroundViewFrame.origin.x;
    y = backGroundViewFrame.origin.y + 30;
    width = backGroundViewFrame.size.width;
    height = 50;
    self.segmentedControl.frame = CGRectMake(x, y, width, height);
}

-(void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.backgroundView setNeedsDisplay];
    [self setFrameToSegmentedControl];
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
}



@end
