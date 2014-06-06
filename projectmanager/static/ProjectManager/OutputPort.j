@import <Foundation/CPObject.j>

@implementation OutputPort : CPView
{
    BOOL        isUsed          @accessors;
    CPString    outputType      @accessors;
    CPBox       output          @accessors;

}

- (id)init:(CGPoint)aPoint length:(float)theLength width:(float)theWidth type:(CPString)type subsection:(float)subsection iteration:(int)i
{
    self = [super initWithFrame:CGRectMake(aPoint.x + theLength, (aPoint.y + subsection*i - (subsection / 2) - 7.5) , 10.0, 15.0)];

    if (self) 
    {
        self.output = [[CPBox alloc] initWithFrame:CGRectMake(aPoint.x + theLength, (aPoint.y + subsection*i - (subsection / 2) - 7.5) , 10.0, 15.0)];
        self.isUsed = false;
        self.outputType = type;
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
    console.log("outputPort");
}


@end

