//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Miguel Angel Moreno Armenteros on 21/03/14.
//  Copyright (c) 2014 Miguel Angel Moreno Armenteros. All rights reserved.
//

#import "BNRHypnosisView.h"

@interface BNRHypnosisView()

    @property(nonatomic, strong) UIColor *circleColor;

@end

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // All BNRHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];

    }
    return self;
}

-(void) setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    //Desplazamiento del contenedor respecto del o,o de la pantalla
    //más la mitad del ancho del contener actual
    float x = bounds.origin.x + bounds.size.width / 2.0;
    float y = bounds.origin.y + bounds.size.height/ 2.0;

    CGPoint center;
    center.x = x;
    center.y = y;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    path.lineWidth = 10;

    // The largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    for (float radius = maxRadius; radius>0; radius = radius-20) {

        [path moveToPoint:CGPointMake(center.x + radius, center.y)];

        [path addArcWithCenter:center
                        radius:radius
                    startAngle:0.0
                      endAngle:(2.0 * M_PI)
                     clockwise:YES];

    }
    
    [self.circleColor setStroke];
    [path stroke];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches: %@", touches );
    NSLog(@"event: %@", event );
    
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    self.circleColor = [UIColor colorWithRed:red
                                       green:green
                                        blue:blue
                                       alpha:1.0];
    [self setNeedsDisplay];
}

@end
