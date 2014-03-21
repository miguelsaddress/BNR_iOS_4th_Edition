//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Miguel Angel Moreno Armenteros on 21/03/14.
//  Copyright (c) 2014 Miguel Angel Moreno Armenteros. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // All BNRHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.window.bounds;
    //Desplazamiento del contenedor respecto del o,o de la pantalla
    //más la mitad del ancho del contener actual
    float x = bounds.origin.x + bounds.size.width / 2.0;
    float y = bounds.origin.y + bounds.size.height/ 2.0;

    CGPoint center;
    center.x = x;
    center.y = y;
    
    // The circle will be the largest that will fit in the view
    float radius = (MIN(bounds.size.width, bounds.size.height)/2.0);
    UIBezierPath *path = [[UIBezierPath alloc] init];
    path.lineWidth = 10;

    [path addArcWithCenter:center
                    radius:radius
                startAngle:0.0
                  endAngle:(2.0 * M_PI)
                 clockwise:YES];
    
    
    UIColor *pathColor = [UIColor lightGrayColor];
    [pathColor setStroke];
    [path stroke];
}


@end
