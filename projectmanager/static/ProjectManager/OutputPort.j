@import <Foundation/CPObject.j>

@import "Link.j"
@import "WorkflowDesignerView.j"


@implementation OutputPort : CPView
{
    BOOL        isUsed          @accessors;
    CPString    outputType      @accessors;
    CPBox       output          @accessors;
    int         jobID           @accessors;

    CPArray     links           @accessors;
    int         selectedLink    @accessors;

}

- (id)init:(CGPoint)aPoint length:(float)theLength width:(float)theWidth type:(CPString)type subsection:(float)subsection iteration:(int)i jobID:(int)aJobID
{
    var aRect = CGRectMake(aPoint.x + theLength, (aPoint.y + subsection*i - (subsection / 2) - 7.5) , 10.0, 15.0);

    self = [super initWithFrame:aRect];
    if (self) 
    {
        links = [[CPArray alloc] init];

        output = [[CPBox alloc] initWithFrame:aRect];
        isUsed = false;
        outputType = type;
        jobID = aJobID;

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
    console.log("DOWN - OutputPort");
    var startMouseLocation = [CPEvent mouseLocation];
    var theWindow = [[CPApplication sharedApplication] mainWindow];


    for (var i = 0; i < [links count]; i++) 
    {
        if (!links[i].isUsed)
        {
            links[i] = [[Link alloc] initWithFrame:CGRectMake(startMouseLocation.x, startMouseLocation.y, 0.0, 0.0) name:""];
            [links[i] makeConnectPointAtCurrentPoint:startMouseLocation controlPoint1:0.0 controlPoint2:0.0 endPoint:startMouseLocation];
            selectedLink = i;
            [[theWindow contentView] addSubview:links[i]];

            return;
        }
    };

    links[i] = [[Link alloc] initWithFrame:CGRectMake(startMouseLocation.x, startMouseLocation.y, 0.0, 0.0) name:""];
    [links[i] makeConnectPointAtCurrentPoint:startMouseLocation controlPoint1:0.0 controlPoint2:0.0 endPoint:startMouseLocation];
    selectedLink = i;
}

- (void)mouseDragged:(CPEvent)anEvent
{
    console.log("DRAG - OutputPort");
    var currentMouseLocation = [CPEvent mouseLocation];

    [links[selectedLink] makeConnectPointAtCurrentPoint:[links[selectedLink] currentPoint] controlPoint1:currentMouseLocation controlPoint2:currentMouseLocation endPoint:currentMouseLocation];
    [links[selectedLink] setFrame:CGRectMake(links[selectedLink].currentPoint.x, links[selectedLink].currentPoint.y, currentMouseLocation.x - links[selectedLink].currentPoint.x, currentMouseLocation.y - links[selectedLink].currentPoint.y)];
    [links[selectedLink] setBounds:CGRectMake(links[selectedLink].currentPoint.x, links[selectedLink].currentPoint.y, currentMouseLocation.x - links[selectedLink].currentPoint.x, currentMouseLocation.y - links[selectedLink].currentPoint.y)];    
    console.log(links[selectedLink]);
}

- (void)mouseUp:(CPEvent)anEvent
{
    console.log("UP - OutputPort");

    //if mouseUp is on inputPort location - create link and set isUsed to true -- also set name -- remove from Subview

    //if not, then destory link at selectedLink.
}



@end

