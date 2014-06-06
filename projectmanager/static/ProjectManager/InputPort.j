@import <Foundation/CPObject.j>

@implementation InputPort : CPView
{
    BOOL        isUsed          @accessors;
    CPString    inputType       @accessors;
    CPBox       input           @accessors;
    int         jobID           @accessors;

}

- (id)init:(CGPoint)aPoint length:(float)theLength width:(float)theWidth type:(CPString)type subsection:(float)subsection iteration:(int)i jobID:(int)aJobID
{
    var aRect = CGRectMake(aPoint.x - 10.0, (aPoint.y + subsection*i - (subsection / 2) - 7.5) , 10.0, 15.0);
    self = [super initWithFrame:aRect];


    if (self) 
    {

        input = [[CPBox alloc] initWithFrame:aRect];
        isUsed = false;
        inputType = type;
        jobID = aJobID;

        [self addSubview:input];
        [self setBounds:aRect];
    }

    return self;
}


- (void)changeBoxAttributes:(float)borderWidth cornerRadius:(float)cornerRadius fillColor:(CPColor)aColor boxType:(CPBoxType)type 
{
        [self.input setBorderWidth:borderWidth];
        [self.input setCornerRadius:cornerRadius];
        [self.input setFillColor:aColor];
        [self.input setBoxType:type];

}

- (void)mouseDragged:(CPEvent)anEvent
{
    console.log("DRAG - Inputport");
}


- (void)mouseDown:(CPEvent)anEvent
{
    console.log("DOWN - InputPort");
}


@end

