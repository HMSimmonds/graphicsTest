@import <Foundation/CPObject.j>

@import "Link.j"
@import "WorkflowDesignerView.j"


@implementation OutputPort : CPView
{
    BOOL        isUsed          @accessors;
    CPString    outputType      @accessors;
    CPBox       output          @accessors;
    int         jobID           @accessors;
    CPUInteger  workflowJobID   @accessors;
    CGPoint     outputStart     @accessors;

    CPArray     links           @accessors;
    int         selectedLink    @accessors;

    CGPoint     pointTest       @accessors;

}

- (id)init:(CGPoint)aPoint length:(float)theLength width:(float)theWidth type:(CPString)type subsection:(float)subsection iteration:(int)i jobID:(int)aJobID workflowJobID:(CPUInteger)aWorkflowJobID
{
    var length = 8.5,
        width = 8.5,
        pointX = aPoint.x + theLength,
        pointY = aPoint.y + subsection*i - (subsection / 2) - length;

    var aRect = CGRectMake(pointX, pointY, length, width);
    outputStart = CGPointMake(pointX + length, pointY + (length/2));

    self = [super initWithFrame:aRect];
    if (self) 
    {
        links = [[CPArray alloc] init];

        output = [[CPBox alloc] initWithFrame:aRect];
        isUsed = false;
        outputType = type;
        jobID = aJobID;
        workflowJobID = aWorkflowJobID;

        [self changeBoxAttributes:0.75 cornerRadius:1.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxOldStyle];

        [self addSubview:output];
        [self setBounds:aRect];
    }
    return self;
}


- (void)changeBoxAttributes:(float)borderWidth cornerRadius:(float)cornerRadius fillColor:(CPColor)aColor boxType:(CPBoxType)type 
{
        [output setBorderWidth:borderWidth];
        [output setCornerRadius:cornerRadius];
        [output setFillColor:aColor];
        [output setBoxType:type];

}


- (void)mouseDown:(CPEvent)anEvent
{
    [[CPNotificationCenter defaultCenter] postNotificationName:@"AddLinkToView" object:nil userInfo:[[CPDictionary alloc] initWithObjects:[workflowJobID, jobID] forKeys:[@"workflow_number", @"output_number"]]];
    [self setNeedsDisplay:YES];
}

- (void)mouseDragged:(CPEvent)anEvent
{
    [[CPNotificationCenter defaultCenter] postNotificationName:@"DragLinkInView" object:nil userInfo:[[CPDictionary alloc] initWithObjects:[workflowJobID, jobID] forKeys:[@"workflow_number", @"output_number"]]];
    [self setNeedsDisplay:YES];
}

- (void)mouseUp:(CPEvent)anEvent
{
    [[CPNotificationCenter defaultCenter] postNotificationName:@"RemoveLinkFromView" object:nil userInfo:[[CPDictionary alloc] initWithObjects:[workflowJobID, jobID] forKeys:[@"workflow_number", @"output_number"]]];
    [self setNeedsDisplay:YES];
}

- (void)mouseEntered:(CPEvent)anEvent
{
     [self changeBoxAttributes:0.75 cornerRadius:1.0 fillColor:[CPColor colorWithHexString:"FF9933"] boxType:CPBoxOldStyle];   
}

- (void)mouseExited:(CPEvent)anEvent
{
    [self changeBoxAttributes:0.75 cornerRadius:1.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxOldStyle];

}

@end

