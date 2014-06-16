@import <Foundation/CPObject.j>

@import "Link.j"
@import "WorkflowDesignerView.j"


@implementation OutputPort : CPView
{
    BOOL        isUsed          @accessors;
    CPString    outputType      @accessors;
    CPBox       output          @accessors;
    int         jobID           @accessors;
    CGPoint     outputStart     @accessors;

    CPArray     links           @accessors;
    int         selectedLink    @accessors;

    CGPoint     pointTest       @accessors;

}

- (id)init:(CGPoint)aPoint length:(float)theLength width:(float)theWidth type:(CPString)type subsection:(float)subsection iteration:(int)i jobID:(int)aJobID
{
    var length = 7.5,
        width = 7.5,
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
    console.log(startMouseLocation);

    // for (var i = 0; i < [links count]; i++) 
    // {
    //     if (!links[i].isUsed)
    //     {
    //         // links[i] = [[Link alloc] initWithFrame:CGRectMake(startMouseLocation.x, startMouseLocation.y, 0.0, 0.0) name:""];
    //         links[i] = [[Link alloc] initWithFrame:CGRectMake(startMouseLocation.x, startMouseLocation.y, 0.0, 0.0) name:""];
    //         [[theWindow contentView] addSubview:links[i]];
    //         [links[i] makeConnectPointAtCurrentPoint:startMouseLocation controlPoint1:0.0 controlPoint2:0.0 endPoint:startMouseLocation];
    //         [[theWindow contentView] setNeedsDisplay:true];
    //         selectedLink = i;
    //         return;
    //     }
    // };

    // links[i] = [[Link alloc] initWithFrame:CGRectMake(startMouseLocation.x, startMouseLocation.y, 0.0, 0.0) name:""];
    // [[theWindow contentView] addSubview:links[i]];
    // [links[i] makeConnectPointAtCurrentPoint:startMouseLocation controlPoint1:0.0 controlPoint2:0.0 endPoint:startMouseLocation];
    // [[theWindow contentView] setNeedsDisplay:true];
    // selectedLink = i;

}

- (void)mouseDragged:(CPEvent)anEvent
{
    console.log("DRAG - OutputPort");
    var currentMouseLocation = [CPEvent mouseLocation];
    console.log(currentMouseLocation);


    // [links[selectedLink] setFrame:CGRectMake(links[selectedLink].currentPoint.x, links[selectedLink].currentPoint.y, currentMouseLocation.x - links[selectedLink].currentPoint.x, currentMouseLocation.y - links[selectedLink].currentPoint.y)];
    // [links[selectedLink] setBounds:CGRectMake(links[selectedLink].currentPoint.x, links[selectedLink].currentPoint.y, currentMouseLocation.x - links[selectedLink].currentPoint.x, currentMouseLocation.y - links[selectedLink].currentPoint.y)];    

    // [links[selectedLink] makeConnectPointAtCurrentPoint:[links[selectedLink] currentPoint] controlPoint1:currentMouseLocation controlPoint2:currentMouseLocation endPoint:currentMouseLocation];

    // [links[selectedLink] setFrame:CGRectMake(0, 0, 6000, 600)];
    // [links[selectedLink] setBounds:CGRectMake(0, 0, 1600, 600)];

    // [links[selectedLink] setFrame:CGRectMake(310, 230, currentMouseLocation.x - links[selectedLink].currentPoint.x, currentMouseLocation.y - links[selectedLink].currentPoint.y)];



    // [links[selectedLink] setNeedsDisplay:true];

}

- (void)mouseUp:(CPEvent)anEvent
{
    // console.log("UP - OutputPort");

    // var theWindow = [[CPApplication sharedApplication] mainWindow];
    // var currentMouseLocation = [CPEvent mouseLocation];

    
    // [links[selectedLink] makeConnectPointAtCurrentPoint:[links[selectedLink] currentPoint] controlPoint1:100 controlPoint2:600 endPoint:currentMouseLocation];

    // links[selectedLink].isUsed = true;

    //if mouseUp is on inputPort location - create link and set isUsed to true -- also set name -- remove from Subview

    //if not, then destory link at selectedLink.
}



@end

