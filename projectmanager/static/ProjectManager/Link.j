@import <Foundation/CPObject.j>

@implementation Link : CPView
{
    CPBezierPath        pathAToB;
    CGPoint             endPoint            @accessors;
    CGPoint             controlPoint1       @accessors;
    CGPoint             controlPoint2       @accessors;
    CGPoint             currentPoint        @accessors;
    CPString            name                @accessors;
}

- (id)initWithFrame:(CGRect)aFrame name:(CPString)aName;
{
    self = [super initWithFrame:aFrame];

    if (self)
    {
        endPoint = CGPointMake(0.0, 0.0);
        controlPoint1 = CGPointMake(0.0, 0.0);
        controlPoint2 = CGPointMake(0.0, 0.0);
        currentPoint = CGPointMake(0.0, 0.0);

        name = aName;
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


- (void)makeConnectPointAtCurrentPoint:(CGPoint)currentPt controlPoint1:(CGPoint)ctrlPt1 controlPoint2:(CGPoint)ctrlPt2 endPoint:(CGPoint)endPt
{
    currentPoint = currentPt
    controlPoint1 = ctrlPt1
    controlPoint2 = ctrlPt2
    endPoint = endPt;
}

- (void)mouseDown
{

}

@end