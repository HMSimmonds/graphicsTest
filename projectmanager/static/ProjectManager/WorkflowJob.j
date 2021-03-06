@import <Foundation/CPObject.j>
@import <AppKit/CPWindowController.j>

@import "InputPort.j"
@import "OutputPort.j"
@import "SettingsHUD.j"

@implementation WorkflowJob : CPView 
{
    CPBox                   workflowJob                     @accessors;
    CPUInteger              outputPortNumber                @accessors;
    CPUInteger              inputPortNumber                 @accessors;

    CPArray                 inputPorts                      @accessors;
    CPArray                 outputPorts                     @accessors;

    CPButton                attributesButton                @accessors;

    CPBundle                theBundle;
    CPUInteger              refNumber                       @accessors;
    CPString                type                            @accessors;

}

- (id)initWithPoint:(CGPoint)aPoint size:(CGSize)aSize inputPortNum:(CPUInteger)inputPortNum outputPortNum:(CPUInteger)outputPortNum type:(CPString)aType refNumber:(CPUInteger)aNumber
{ 
    var aRect = CGRectMake(aPoint.x, aPoint.y, aSize.height, aSize.width);
    self = [super initWithFrame:aRect];


    if (self)
    {
        workflowJob = [[CPBox alloc] initWithFrame:aRect];
        refNumber = aNumber;
        //init. plus button
        attributesButton = [[CPButton alloc] initWithFrame:CGRectMake(12.5, 2.5,7.5, 7.5)];
        [attributesButton setBezelStyle:CPTexturedRoundedBezelStyle];

        theBundle = [CPBundle mainBundle];

        type = aType;
        var plusImage = [[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"plus.png"] size:CGSizeMake(7.5, 7.5)];

        [attributesButton setImage:plusImage];
        [attributesButton sizeToFit];
        [attributesButton setBordered:NO];

        [attributesButton setAction:@selector(viewAttributes:)];
        [attributesButton setTarget:self];
        
        
        [self addSubview:workflowJob];
        [self setBounds:aRect];
        [self addSubview:attributesButton];



        var subsection;
        outputPortNumber = outputPortNum;
        inputPortNumber = inputPortNum;

        //init outputPortsController -- 
        subsection = (aSize.width / outputPortNum);
        outputPorts = [[CPArray alloc] init];

        for (var i = 0; i < outputPortNum; i++)
        {
            outputPorts[i] = [[OutputPort alloc] init:aPoint length:aSize.height width:aSize.width type:aType subsection:subsection iteration:(i+1) jobID:i workflowJobID:refNumber];
        };
        
        
        //init inputPortsController --
        inputPorts = [[CPArray alloc] init];
        subsection = (aSize.width / inputPortNum);
        
        for (i = 0; i < inputPortNum; i++)
        {
            inputPorts[i] = [[InputPort alloc] init:aPoint length:aSize.height width:aSize.width type:aType subsection:subsection iteration:(i+1) jobID:i workflowJobID:refNumber];
        };
    }
    return self;
}


- (void)changeBoxAttributes:(float)borderWidth cornerRadius:(float)cornerRadius fillColor:(CPColor)aColor boxType:(CPBoxType)aType title:(CPString)aTitle 
{
        [workflowJob setBorderWidth:borderWidth];
        [workflowJob setCornerRadius:cornerRadius];
        [workflowJob setFillColor:aColor];
        [workflowJob setBoxType:aType];
        [workflowJob setTitle:aTitle];
        [workflowJob setBorderColor:[CPColor colorWithHexString:"999999"]];
        // [workflowJob setTitlePosition:6];
}

- (void)mouseDragged:(CPEvent)anEvent
{
    console.log("DRAG - WorkflowJob");
}

- (void)mouseDown:(CPEvent)anEvent
{
    console.log("DOWN -  WorkflowJob");
    console.log([CPEvent mouseLocation]);
}

- (void)viewAttributes:(id)aSender
{
    alert("Hello");
    console.log("hello");
}

- (void)mouseEntered:(CPEvent)anEvent
{
    [workflowJob setBorderColor:[CPColor colorWithHexString:"4C4C4C"]];
    [workflowJob setBorderWidth:1.5];
}

- (void)mouseExited:(CPEvent)anEvent
{
    [workflowJob setBorderColor:[CPColor colorWithHexString:"999999"]];
    [workflowJob setBorderWidth:1.0];
}

@end




// @implementation CPView (logClickCount)

// - (void)mouseDown:(CPEvent)anEvent
// {
// // console.log(_cmd + " clickCount=" + [anEvent clickCount]);
// console.log(self);
//     if ([self mouseDownCanMoveWindow])
//         [super mouseDown:anEvent];
// }
// @end