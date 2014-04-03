//
//  BNRScrollViewController.m
//  HypnoNerd
//
//  Created by Miguel Angel Moreno Armenteros on 03/04/14.
//  Copyright (c) 2014 MIGUEL ANGEL MORENO ARMENTEROS. All rights reserved.
//

#import "BNRScrollViewController.h"
#import "BNRHypnosisView.h"

@interface BNRScrollViewController () <UIScrollViewDelegate>
@property(nonatomic,weak) UIScrollView *scrollView;
@property(nonatomic,weak) BNRHypnosisView *hypnosisView;
@property(nonatomic) CGRect scrollViewRect;
@end

@implementation BNRScrollViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Pinch to zoom";
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = i;
    }
    return self;
}

-(void) loadView
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.scrollViewRect = CGRectMake(screenRect.origin.x, screenRect.origin.y, screenRect.size.width*4, screenRect.size.height* 4);
    self.scrollViewRect = CGRectMake(screenRect.origin.x, screenRect.origin.y, screenRect.size.width, screenRect.size.height);

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.scrollViewRect];
    BNRHypnosisView *hv = [[BNRHypnosisView alloc] initWithFrame:self.scrollViewRect];
    [scrollView addSubview:hv];

    self.hypnosisView = hv;
    self.scrollView = scrollView;

    self.view = scrollView;

}

-(void) viewDidLoad
{
    [super viewDidLoad];
    self.scrollView.minimumZoomScale = 0.25;
    self.scrollView.maximumZoomScale = 8.0;
    self.scrollView.contentSize = CGSizeMake(self.scrollViewRect.size.width, self.scrollViewRect.size.height);
    self.scrollView.delegate = self;
}

-(UIView*) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.hypnosisView;
}


@end
