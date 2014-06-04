@import <Foundation/CPObject.j>

@implementation Link : CPView
{
    CPBezierPath        pathAToB;
    CGPoint             endPoint            @accessors;
    CGPoint             controlPoint1       @accessors;
    CGPoint             controlPoint2       @accessors;
    CGPoint             currentPoint        @accessors;
}

- (id)initWithFrame:(CGRect)aFrame;
{
    self = [super initWithFrame:aFrame];

    if (self)
    {
        self.endPoint = CGPointMake(0.0, 0.0);
        self.controlPoint1 = CGPointMake(0.0, 0.0);
        self.controlPoint2 = CGPointMake(0.0, 0.0);
        self.currentPoint = CGPointMake(0.0, 0.0);
    }
    return self
}



- (void)drawRect:(CGRect)aRect
{
    pathAToB = [[CPBezierPath alloc] init];

    var context = [[CPGraphicsContext currentContext] graphicsPort],
        shadowColor = [CPColor colorWithCalibratedWhite:1 alpha:1];

    CGContextSetFillColor(context, [CPColor colorWithCalibratedWhite:0.9 alpha:1.0]);

    CGContextSetShadowWithColor(context, CGSizeMake(1, 1), 0, shadowColor);
    CGContextSetStrokeColor(context, [CPColor blackColor]);

    [pathAToB moveToPoint:currentPoint];
    [pathAToB setLineWidth:2.0];

    [pathAToB curveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];


    [pathAToB stroke];  

}


- (void)makeConnectPoint:(float)currentPointX currentPointY:(float)currentPointY 
        controlPoint1X:(float)controlPoint1X controlPoint1Y:(float)controlPoint1Y 
        controlPoint2X:(float)controlPoint2X controlPoint2Y:(float)controlPoint2Y 
        endPointX:(float)endPointX endPointY:(float)endPointY
{
    self.currentPoint = CGPointMake(currentPointX, currentPointY);
    self.controlPoint1 = CGPointMake(controlPoint1X, controlPoint1Y);
    self.controlPoint2 = CGPointMake(controlPoint2X, controlPoint2Y);
    self.endPoint = CGPointMake(endPointX, endPointY);
}

- (void)mouseDown
{

}

@end