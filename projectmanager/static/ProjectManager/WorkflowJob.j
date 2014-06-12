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

    CPButton                addAttributesButton             @accessors;

}

- (id)initWithPoint:(CGPoint)aPoint size:(CGSize)aSize inputPortNum:(CPUInteger)inputPortNum outputPortNum:(CPUInteger)outputPortNum type:(CPString)aType
{ 
    var aRect = CGRectMake(aPoint.x, aPoint.y, aSize.height, aSize.width);
    self = [super initWithFrame:aRect];


    if (self)
    {
        workflowJob = [[CPBox alloc] initWithFrame:aRect];
        addAttributesButton = [[CPButton alloc] initWithFrame:CGRectMake(12.5, 7.5, 12.5, 12.5)];
        [addAttributesButton setBezelStyle:CPRegularSquareBezelStyle];



        var plusImage = [[CPImage alloc] initWithContentsOfFile:@"Resources/plus.png" size:CGSizeMake(10.0, 10.0)];

        // [addAttributesButton setImage:plusImage];
        [addAttributesButton sizeToFit];
        
        [self addSubview:workflowJob];
        [self setBounds:aRect];
        [self addSubview:addAttributesButton];

        var subsection;
        outputPortNumber = outputPortNum;
        inputPortNumber = inputPortNum;

        //init outputPortsController -- 
        subsection = (aSize.width / outputPortNum);
        outputPorts = [[CPArray alloc] init];

        for (var i = 0; i < outputPortNum; i++)
        {
            outputPorts[i] = [[OutputPort alloc] init:aPoint length:aSize.height width:aSize.width type:aType subsection:subsection iteration:(i+1) jobID:i];
        };
        
        
        //init inputPortsController --
        inputPorts = [[CPArray alloc] init];
        subsection = (aSize.width / inputPortNum);
        
        for (i = 0; i < inputPortNum; i++)
        {
            inputPorts[i] = [[InputPort alloc] init:aPoint length:aSize.height width:aSize.width type:aType subsection:subsection iteration:(i+1) jobID:i];
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