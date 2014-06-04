@import <AppKit/CPWindowController.j>

@implementation RoundedRectangle : CPView 
{

}

- (void)drawRect:(CGRect)aRect
{
    var radius = 15.0,
        context = [[CPGraphicsContext currentContext] graphicsPort],
        colorID = [CPColor colorWithHexString:"E6E6E6"];

    CGContextSetFillColor(context, colorID);
    

    CGContextFillRoundedRectangleInRect(context, [self bounds], radius, YES, YES, YES, YES);

}


@end