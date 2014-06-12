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
    var aRect = CGRectMake(aPoint.x - 7.5, (aPoint.y + subsection*i - (subsection / 2) - 7.5) , 7.5, 7.5);
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
    // [self setNeedsDisplay:true];
    return self;
}


- (void)changeBoxAttributes:(float)borderWidth cornerRadius:(float)cornerRadius fillColor:(CPColor)aColor boxType:(CPBoxType)type 
{
        [input setBorderWidth:borderWidth];
        [input setCornerRadius:cornerRadius];
        [input setFillColor:aColor];
        [input setBoxType:type];

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

