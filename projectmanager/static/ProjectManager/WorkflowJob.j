@import <AppKit/CPWindowController.j>

@import "InputPort.j"
@import "OutputPort.j"

@implementation WorkflowJob : CPView 
{
    CPBox                   workflowJob                     @accessors;
    CPUInteger              outputPortNumber                @accessors;
    CPUInteger              inputPortNumber                 @accessors;

    CPArray                 inputPorts                      @accessors;
    CPArray                 outputPorts                     @accessors;
}

- (id)initWithPoint:(CGPoint)aPoint size:(CGSize)aSize inputPortNum:(CPUInteger)inputPortNum outputPortNum:(CPUInteger)outputPortNum type:(CPString)aType
{ 
    self = [super initWithFrame:CGRectMake(aPoint.x, aPoint.y, aSize.height, aSize.width)];

    if (self)
    {
        workflowJob = [[CPBox alloc] initWithFrame:CGRectMake(aPoint.x, aPoint.y, aSize.height, aSize.width)];
        
        var subsection;
        outputPortNumber = outputPortNum;
        inputPortNumber = inputPortNum;

        //init outputPortsController -- 
        subsection = (aSize.width / outputPortNum);
        outputPorts = [[CPArray alloc] init];

        for (var i = 0; i < outputPortNum; i++)
        {
            outputPorts[i] = [[OutputPort alloc] init:aPoint length:aSize.height width:aSize.width type:aType subsection:subsection iteration:(i+1)];
        };
        
        
        //init inputPortsController --
        inputPorts = [[CPArray alloc] init];
        subsection = (aSize.width / inputPortNum);
        
        for (i = 0; i < inputPortNum; i++)
        {
            inputPorts[i] = [[InputPort alloc] init:aPoint length:aSize.height width:aSize.width type:aType subsection:subsection iteration:(i+1)];
        };
    
    }
    return self;
}


- (void)changeBoxAttributes:(float)borderWidth cornerRadius:(float)cornerRadius fillColor:(CPColor)aColor boxType:(CPBoxType)type title:(CPString)aTitle 
{
        [workflowJob setBorderWidth:borderWidth];
        [workflowJob setCornerRadius:cornerRadius];
        [workflowJob setFillColor:aColor];
        [workflowJob setBoxType:type];
        [workflowJob setTitle:aTitle];
}

- (void)mouseDragged:(CPEvent)anEvent
{
    // [super mouseDown:anEvent];

    console.log("workflowJob");
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