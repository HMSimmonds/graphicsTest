@import <Foundation/CPObject.j>

@implementation OutputPort : CPView
{
    BOOL        isUsed          @accessors;
    CPString    outputType      @accessors;
    CPBox       output          @accessors;

}

- (id)init:(CGPoint)aPoint length:(float)theLength width:(float)theWidth type:(CPString)type subsection:(float)subsection iteration:(int)i
{
    var aRect = CGRectMake(aPoint.x + theLength, (aPoint.y + subsection*i - (subsection / 2) - 7.5) , 10.0, 15.0);

    self = [super initWithFrame:aRect];
    if (self) 
    {

        output = [[CPBox alloc] initWithFrame:aRect];
        isUsed = false;
        outputType = type;

        [self addSubview:output];
        [self setBounds:aRect];
    }
    return self;
}


- (void)changeBoxAttributes:(float)borderWidth cornerRadius:(float)cornerRadius fillColor:(CPColor)aColor boxType:(CPBoxType)type 
{
        [self.output setBorderWidth:borderWidth];
        [self.output setCornerRadius:cornerRadius];
        [self.output setFillColor:aColor];
        [self.output setBoxType:type];

}

- (void)mouseDragged:(CPEvent)anEvent
{
    console.log("DRAG - OutputPort");
}

- (void)mouseDown:(CPEvent)anEvent
{
    console.log("DOWN - OutputPort");
}


@end

