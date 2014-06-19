@import <Foundation/CPObject.j>

@implementation InputPort : CPView
{
    BOOL        isUsed          @accessors;
    CPString    inputType       @accessors;
    CPBox       input           @accessors;
    int         jobID           @accessors;
    CPUInteger  workflowJobID   @accessors;
    CGPoint     inputEnd      @accessors;

}

- (id)init:(CGPoint)aPoint length:(float)theLength width:(float)theWidth type:(CPString)type subsection:(float)subsection iteration:(int)i jobID:(int)aJobID workflowJobID:(CPUInteger)aWorkflowJobID
{
    var length = 7.5,
        width = 7.5,
        pointX = aPoint.x - length,
        pointY = aPoint.y + subsection*i - (subsection / 2) - length;

    var aRect = CGRectMake(pointX, pointY, length, width);
    self = [super initWithFrame:aRect];

    inputEnd = CGPointMake(pointX, pointY + (length /2));


    if (self) 
    {

        input = [[CPBox alloc] initWithFrame:aRect];
        isUsed = false;
        inputType = type;
        jobID = aJobID;
        workflowJobID = aWorkflowJobID;

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

// - (void)mouseDragged:(CPEvent)anEvent
// {
//     console.log("DRAG - Inputport");
// }


// - (void)mouseDown:(CPEvent)anEvent
// {
//     console.log("DOWN - InputPort");
// }

// - (void)mouseDragged:(CPEvent)anEvent
// {
//     [[CPNotificationCenter defaultCenter] postNotificationName:@"MouseHoverInView" object:nil userInfo:[[CPDictionary alloc] initWithObjects:[workflowJobID, jobID] forKeys:[@"workflow_number", @"input_number"]]];

// }

// - (void)mouseExited:(CPEvent)anEvent
// {
//     [[CPNotificationCenter defaultCenter] postNotificationName:@"MouseHoverInView" object:nil userInfo:[[CPDictionary alloc] initWithObjects:[-1, -1] forKeys:[@"workflow_number", @"input_number"]]];    
// }


@end

