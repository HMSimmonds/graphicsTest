@import <AppKit/CPWindowController.j>

@import "InputPort.j"
@import "OutputPort.j"

@implementation WorkflowJob : CPObject 
{
    CPBox                   workflowJob                     @accessors;
    CPUInteger              outputPortNumber                @accessors;
    CPUInteger              inputPortNumber                 @accessors;
    CPArrayController       outputPortsController           @accessors;
    CPArrayController       inputPortsController            @accessors;
}

- (id)initWithPoint:(CGPoint)aPoint length:(float)theLength width:(float)theWidth inputPortNum:(CPUInteger)inputPortNum outputPortNum:(CPUInteger)outputPortNum type:(CPString)aType
{ 
    self = [super init];

    if (self)
    {
        workflowJob = [[CPBox alloc] initWithFrame:CGRectMake(aPoint.x, aPoint.y, theLength, theWidth)];
        
        var subsection;
        outputPortNumber = outputPortNum;
        inputPortNumber = inputPortNum;

        //init outputPortsController -- 
        subsection = (theWidth / outputPortNum);
        outputPortsController = [[CPArrayController alloc] init];

        for (var i = 0; i < outputPortNum; i++)
            [outputPortsController addObject:[[OutputPort alloc] init:aPoint length:theLength width:theWidth type:aType subsection:subsection iteration:(i+1)]];
        
        // console.log([[self.outputPortsController selectedObjects] objectAtIndex:0]);
        
        //init inputPortsController --
        inputPortsController = [[CPArrayController alloc] init];
        subsection = (theWidth / inputPortNum);
        
        for (i = 0; i < inputPortNum; i++)
            [inputPortsController addObject:[[InputPort alloc] init:aPoint length:theLength width:theWidth type:aType subsection:subsection iteration:(i+1)]];
    
        // console.log([[self.inputPortsController selectedObjects] objectAtIndex:0]);
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

@end