@import <Foundation/CPObject.j>

@import "WorkflowJob.j"
@import "Link.j"
@import "OutputPort.j"
@import "Seed.j"

//TEMPORARY -> length and width for workflowJob boxes
var LENGTH = 100.0,
    WIDTH = 60.0;

@implementation WorkflowDesignerView : CPView
{
                CPArray             points                      @accessors;
                CPArray             workflowJobs                @accessors;
                CPArray             links                       @accessors;
                CPArray             seeds                       @accessors;

                CPArray             currentInputHover; //array, pos. 0 = workflowJob, pos. 1 = inputNumber
}


- (id)initDesigner 
{
    self = [super init];
    if (self)
    {
        //points array
        [self setBackgroundColor:[CPColor colorWithHexString:"FFFFFF"]];

        points = [[CPArray alloc] init];
        workflowJobs = [[CPArray alloc] init];
        links = [[CPArray alloc] init];
        seeds = [[CPArray alloc] init];

        currentInputHover = [[CPArray alloc] init];
        currentInputHover[0] = -1;
        currentInputHover[1] = -1;

/* ------------------------------ CODE TO BE AUTOMATED ---------------------------- */
        //create points for origins of workflowJob boxes NOTE: use points to create bezier curves
        points[0] = CGPointMake(450.0, 100.0);
        points[1] = CGPointMake(900.0, 550.0);
        points[2] = CGPointMake(900.0, 100.0);
        points[3] = CGPointMake(450.0, 550.0);
        points[4] = CGPointMake(900.0, 300.0);
        points[5] = CGPointMake(175.0, 300.0);

        //seed point
        points[6] = CGPointMake(40.0, 200.0);
        

        //create workflowJobs on designerView - note length and width will depend on the type of just with number of inputs
        workflowJobs[0] = [[WorkflowJob alloc] initWithPoint:points[0] size:CGSizeMake(WIDTH*2, LENGTH) inputPortNum:3 outputPortNum:2 type:"Lyrical" refNumber:0];
        workflowJobs[1] = [[WorkflowJob alloc] initWithPoint:points[1] size:CGSizeMake(WIDTH, LENGTH) inputPortNum:1 outputPortNum:1 type:"Black & White" refNumber:1];
        workflowJobs[2] = [[WorkflowJob alloc] initWithPoint:points[2] size:CGSizeMake(WIDTH*2, LENGTH) inputPortNum:1 outputPortNum:3 type:"Cropped Border" refNumber:2];
        workflowJobs[3] = [[WorkflowJob alloc] initWithPoint:points[3] size:CGSizeMake(WIDTH, LENGTH) inputPortNum:1 outputPortNum:1 type:"Cropped Border" refNumber:3];
        workflowJobs[4] = [[WorkflowJob alloc] initWithPoint:points[4] size:CGSizeMake(WIDTH, LENGTH) inputPortNum:1 outputPortNum:1 type:"Cropped Border" refNumber:4];
        workflowJobs[5] = [[WorkflowJob alloc] initWithPoint:points[5] size:CGSizeMake(WIDTH*2.5, LENGTH) inputPortNum:1 outputPortNum:4 type:"Cropped Border" refNumber:5];

        // workflowJobs[0] = [[WorkflowJob alloc] initWithCibNamed:"WorkflowJobView.cib" bundle:[CPBundle mainBundle]];
        // workflowJobs[1] = [[WorkflowJob alloc] initWithCibNamed:"WorkflowJobView.cib" bundle:[CPBundle mainBundle]];
        // workflowJobs[2] = [[WorkflowJob alloc] initWithCibNamed:"WorkflowJobView.cib" bundle:[CPBundle mainBundle]];
        // workflowJobs[3] = [[WorkflowJob alloc] initWithCibNamed:"WorkflowJobView.cib" bundle:[CPBundle mainBundle]];
        // workflowJobs[4] = [[WorkflowJob alloc] initWithCibNamed:"WorkflowJobView.cib" bundle:[CPBundle mainBundle]];


        //change attributes for various workflowJobs
        [workflowJobs[0] changeBoxAttributes:1.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Lryic Removal"];
        [workflowJobs[1] changeBoxAttributes:1.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Black/White Image"];
        [workflowJobs[2] changeBoxAttributes:1.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Border Crop"];
        [workflowJobs[3] changeBoxAttributes:1.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Border Crop"];
        [workflowJobs[4] changeBoxAttributes:1.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Border Crop"];
        [workflowJobs[5] changeBoxAttributes:1.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Border Crop"];

        seeds[0] = [[Seed alloc] initWithPoint:points[6] size:CGSizeMake(35.0, 55.0) pageNum:3];

        [seeds[0] changeBoxAttributes:1.5 cornerRadius:5.0 fillColor:[CPColor colorWithHexString:"303030"] boxType:CPBoxPrimary title:"Seed"];


    // links[0] = [[Link alloc] initWithName:"" workflowStart:null workflowEnd:null outputRef:null inputRef:null];
    // links[1] = [[Link alloc] initWithName:"" workflowStart:null workflowEnd:null outputRef:null inputRef:null];
    // links[2] = [[Link alloc] initWithName:"" workflowStart:null workflowEnd:null outputRef:null inputRef:null];
    // links[3] = [[Link alloc] initWithName:"" workflowStart:null workflowEnd:null outputRef:null inputRef:null];
    // links[4] = [[Link alloc] initWithName:"" workflowStart:null workflowEnd:null outputRef:null inputRef:null];
    // links[5] = [[Link alloc] initWithName:"" workflowStart:null workflowEnd:null outputRef:null inputRef:null];
    // links[6] = [[Link alloc] initWithName:"" workflowStart:null workflowEnd:null outputRef:null inputRef:null];
    // links[7] = [[Link alloc] initWithName:"" workflowStart:null workflowEnd:null outputRef:null inputRef:null];



    //     [links[0] makeConnectPointAtCurrentPoint:workflowJobs[5].outputPorts[0].outputStart controlPoint1:workflowJobs[0].inputPorts[0].inputEnd controlPoint2:workflowJobs[0].inputPorts[0].inputEnd endPoint:workflowJobs[0].inputPorts[0].inputEnd];
    //     [links[1] makeConnectPointAtCurrentPoint:workflowJobs[5].outputPorts[1].outputStart controlPoint1:workflowJobs[0].inputPorts[1].inputEnd controlPoint2:workflowJobs[0].inputPorts[1].inputEnd endPoint:workflowJobs[0].inputPorts[1].inputEnd];
    //     [links[2] makeConnectPointAtCurrentPoint:workflowJobs[5].outputPorts[2].outputStart controlPoint1:workflowJobs[0].inputPorts[2].inputEnd controlPoint2:workflowJobs[0].inputPorts[2].inputEnd endPoint:workflowJobs[0].inputPorts[2].inputEnd];
    //     [links[3] makeConnectPointAtCurrentPoint:workflowJobs[5].outputPorts[3].outputStart controlPoint1:workflowJobs[3].inputPorts[0].inputEnd controlPoint2:workflowJobs[3].inputPorts[0].inputEnd endPoint:workflowJobs[3].inputPorts[0].inputEnd];
    //     [links[4] makeConnectPointAtCurrentPoint:workflowJobs[0].outputPorts[0].outputStart controlPoint1:workflowJobs[2].inputPorts[0].inputEnd controlPoint2:workflowJobs[2].inputPorts[0].inputEnd endPoint:workflowJobs[2].inputPorts[0].inputEnd];
    //     [links[5] makeConnectPointAtCurrentPoint:workflowJobs[0].outputPorts[1].outputStart controlPoint1:workflowJobs[4].inputPorts[0].inputEnd controlPoint2:workflowJobs[4].inputPorts[0].inputEnd endPoint:workflowJobs[4].inputPorts[0].inputEnd];
    //     [links[6] makeConnectPointAtCurrentPoint:workflowJobs[3].outputPorts[0].outputStart controlPoint1:workflowJobs[1].inputPorts[0].inputEnd controlPoint2:workflowJobs[1].inputPorts[0].inputEnd endPoint:workflowJobs[1].inputPorts[0].inputEnd];
        // [links[7] makeConnectPointAtCurrentPoint: controlPoint1: controlPoint2: endPoint:];
/* --------------------------------------- AUTOMATED CODE END --------------------------- */

        //iterate through workflows inputs and outputs to add to designerView subview
        var j,
            i,
            k,
            f;
        for (i = 0; i < [workflowJobs count]; i++)
        {
            for (j = 0; j < workflowJobs[i].inputPortNumber; j++)
            {
                [workflowJobs[i].inputPorts[j] changeBoxAttributes:0.75 cornerRadius:1.0 fillColor:[CPColor colorWithHexString:"FF4D4D"] boxType:CPBoxOldStyle];
            };

            for (k = 0; k < workflowJobs[i].outputPortNumber; k++)
            {
                [workflowJobs[i].outputPorts[k] changeBoxAttributes:0.75 cornerRadius:1.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxOldStyle];
            };
        };

        for (i = 0; i < [workflowJobs count]; i++) 
        {
            [self addSubview:workflowJobs[i]];

            for (j = 0; j < workflowJobs[i].outputPortNumber; j++)
            {
                [self addSubview:workflowJobs[i].outputPorts[j]];
                
            };

            for (k = 0; k < workflowJobs[i].inputPortNumber; k++)
            {
                [self addSubview:workflowJobs[i].inputPorts[k]];
            };

        };

        for (i = 0; i < [seeds count]; i++)
        {
            [self addSubview:seeds[i]];
        }

    }

    //register notification observers
    [[CPNotificationCenter defaultCenter] addObserver:self
                                          selector:@selector(receiveAddLink:)
                                          name:@"AddLinkToView"
                                          object:nil];
    
    [[CPNotificationCenter defaultCenter] addObserver:self
                                          selector:@selector(receiveRemoveLink:)
                                          name:@"RemoveLinkFromView"
                                          object:nil];

    [[CPNotificationCenter defaultCenter] addObserver:self
                                          selector:@selector(receiveDragLink:)
                                          name:@"DragLinkInView"
                                          object:nil];

    [[CPNotificationCenter defaultCenter] addObserver:self
                                          selector:@selector(receiveCurrentMouseHover:)
                                          name:@"MouseHoverInView"
                                          object:nil];
    [self setNeedsDisplay:YES];
    // [self display];

    return self;
}


// - (void)mouseDragged:(CPEvent)anEvent
// {   
    
//     console.log("DRAG - WorkflowDesigner");
//     console.log([CPEvent mouseLocation]);
    
// }

- (void)mouseDown:(CPEvent)anEvent
{
    console.log("DOWN - WorkflowDesigner");
        console.log([self convertPoint:[CPEvent mouseLocation] fromView:nil]);

}

//to draw lines
- (void)drawRect:(CGRect)aRect
{
    var i;
    for (i = 0; i < [links count]; i++)
    {
        links[i].pathAToB = [[CPBezierPath alloc] init];

        var context = [[CPGraphicsContext currentContext] graphicsPort],
            shadowColor = [CPColor colorWithCalibratedWhite:1 alpha:1];

        CGContextSetFillColor(context, [CPColor colorWithCalibratedWhite:0.9 alpha:1.0]);

        CGContextSetShadowWithColor(context, CGSizeMake(1, 1), 0, shadowColor);
        CGContextSetStrokeColor(context, [CPColor blackColor]);

        [links[i].pathAToB moveToPoint:links[i].currentPoint];
        [links[i].pathAToB setLineWidth:2.0];

        [links[i].pathAToB curveToPoint:links[i].endPoint controlPoint1:links[i].controlPoint1 controlPoint2:links[i].controlPoint2];


        [links[i].pathAToB stroke];  
        [self setNeedsDisplay:true];

    };

}

- (void)receiveAddLink:(CPNotification)aNotification
{
    
    var info = [aNotification userInfo],    
        mouseLocation = [CPEvent mouseLocation],
        workflowNumber = [info objectForKey:"workflow_number"],
        outputNumber = [info objectForKey:"output_number"],
        k = 0,
        currentMouseLocation = [self convertPoint:mouseLocation fromView:nil];

    while (links[k] != null)
        k++;
    
    console.log(links);
    links[k] = [[Link alloc] initWithName:"" workflowStart:workflowNumber workflowEnd:-1 outputRef:outputNumber inputRef:-1];
    [links[k] makeConnectPointAtCurrentPoint:currentMouseLocation controlPoint1:0.0 controlPoint2:0.0 endPoint:currentMouseLocation];
    console.log("Add Link");
}


- (void)receiveRemoveLink:(CPNotification)aNotification
{
    
    var info = [aNotification userInfo],
        mouseLocation = [CPEvent mouseLocation],
        workflowNumber = [info objectForKey:"workflow_number"],
        outputNumber = [info objectForKey:"output_number"],
        k,
        currentMouseLocation = [self convertPoint:mouseLocation fromView:nil];
        console.log(currentMouseLocation);

    for (k = 0; k < [links count]; k++)
    {
        if ((links[k].workflowStart == workflowNumber) && (links[k].outputRef == outputNumber))
        {
            if ([self isInInputLocation:currentMouseLocation])
            {
                //create link
                links[k].workflowEnd = currentInputHover[0];
                links[k].inputRef = currentInputHover[1];
                links[k].isUsed = true;
                [links[k] makeConnectPointAtCurrentPoint:workflowJobs[workflowNumber].outputPorts[outputNumber].outputStart controlPoint1:workflowJobs[workflowNumber].outputPorts[outputNumber].outputStart controlPoint2:workflowJobs[workflowNumber].outputPorts[outputNumber].outputStart endPoint:workflowJobs[currentInputHover[0]].inputPorts[currentInputHover[1]].inputEnd];

                console.log("Create Link");
            }

            else //link is not used -> remove
            {
                links[k] = null;
                console.log("Remove Link");
                [self display];
            }
            break;
        }
    };
}


- (void)receiveDragLink:(CPNotification)aNotification
{
    var info = [aNotification userInfo],
        mouseLocation = [CPEvent mouseLocation],
        workflowNumber = [info objectForKey:"workflow_number"],
        outputNumber = [info objectForKey:"output_number"],
        k,
        currentMouseLocation = [self convertPoint:mouseLocation fromView:nil];

    for (k = 0; k < [links count]; k++)
    {
        if ((links[k].workflowStart == workflowNumber) && (links[k].outputRef == outputNumber))
        {
            [links[k] makeConnectPointAtCurrentPoint:workflowJobs[workflowNumber].outputPorts[outputNumber].outputStart controlPoint1:currentMouseLocation controlPoint2:currentMouseLocation endPoint:currentMouseLocation];
            console.log("Drag Link");
        }
    };
    [self display];

}

// - (void)receiveCurrentMouseHover:(CPNotification)aNotification
// {
//     console.log("Hover");
    
//     var info = [aNotification userInfo],
//         workflowNumber = [info objectForKey:"workflow_number"],
//         inputNumber = [info objectForKey:"input_number"];

//     currentInputHover[0] = workflowNumber;
//     currentInputHover[1] = inputNumber;

// }


- (BOOL)isInInputLocation:(CGPoint)mouseLocation
{
    var i,
        j,
        k;

    for (i = 0; i < [workflowJobs count]; i++)
    {
        for (j = 0; j < workflowJobs[i].inputPortNumber; j++)
        {
            var aFrame = [workflowJobs[i].inputPorts[j] frame];
            
            aFrame.size.height = 35.0;
            aFrame.size.width = 10.0;

            console.log(aFrame);
            console.log(mouseLocation);


            if (CPRectContainsPoint(aFrame, mouseLocation))
            {
                console.log("ENTERED");
                currentInputHover[0] = i;
                currentInputHover[1] = j;
                return true;
            }
            
        };
    };
    return false;
}
@end
