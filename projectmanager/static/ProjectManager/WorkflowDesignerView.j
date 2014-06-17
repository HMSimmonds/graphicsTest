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
}


- (void)awakeFromCib
{
    // Subscriptions for self.
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
        workflowJobs[0] = [[WorkflowJob alloc] initWithPoint:points[0] size:CGSizeMake(WIDTH*2, LENGTH) inputPortNum:3 outputPortNum:2 type:"Lyrical"];
        workflowJobs[1] = [[WorkflowJob alloc] initWithPoint:points[1] size:CGSizeMake(WIDTH, LENGTH) inputPortNum:1 outputPortNum:1 type:"Black & White"];
        workflowJobs[2] = [[WorkflowJob alloc] initWithPoint:points[2] size:CGSizeMake(WIDTH*2, LENGTH) inputPortNum:1 outputPortNum:3 type:"Cropped Border"];
        workflowJobs[3] = [[WorkflowJob alloc] initWithPoint:points[3] size:CGSizeMake(WIDTH, LENGTH) inputPortNum:1 outputPortNum:1 type:"Cropped Border"];
        workflowJobs[4] = [[WorkflowJob alloc] initWithPoint:points[4] size:CGSizeMake(WIDTH, LENGTH) inputPortNum:1 outputPortNum:1 type:"Cropped Border"];
        workflowJobs[5] = [[WorkflowJob alloc] initWithPoint:points[5] size:CGSizeMake(WIDTH*2.5, LENGTH) inputPortNum:1 outputPortNum:4 type:"Cropped Border"];

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


        links[0] = [[Link alloc] initWithName:""];
        links[1] = [[Link alloc] initWithName:""];
        links[2] = [[Link alloc] initWithName:""];
        links[3] = [[Link alloc] initWithName:""];
        links[4] = [[Link alloc] initWithName:""];
        links[5] = [[Link alloc] initWithName:""];
        links[6] = [[Link alloc] initWithName:""];
        links[7] = [[Link alloc] initWithName:""];

        [links[0] makeConnectPointAtCurrentPoint:workflowJobs[5].outputPorts[0].outputStart controlPoint1:workflowJobs[0].inputPorts[0].inputEnd controlPoint2:workflowJobs[0].inputPorts[0].inputEnd endPoint:workflowJobs[0].inputPorts[0].inputEnd];
        [links[1] makeConnectPointAtCurrentPoint:workflowJobs[5].outputPorts[1].outputStart controlPoint1:workflowJobs[0].inputPorts[1].inputEnd controlPoint2:workflowJobs[0].inputPorts[1].inputEnd endPoint:workflowJobs[0].inputPorts[1].inputEnd];
        [links[2] makeConnectPointAtCurrentPoint:workflowJobs[5].outputPorts[2].outputStart controlPoint1:workflowJobs[0].inputPorts[2].inputEnd controlPoint2:workflowJobs[0].inputPorts[2].inputEnd endPoint:workflowJobs[0].inputPorts[2].inputEnd];
        [links[3] makeConnectPointAtCurrentPoint:workflowJobs[5].outputPorts[3].outputStart controlPoint1:workflowJobs[3].inputPorts[0].inputEnd controlPoint2:workflowJobs[3].inputPorts[0].inputEnd endPoint:workflowJobs[3].inputPorts[0].inputEnd];
        [links[4] makeConnectPointAtCurrentPoint:workflowJobs[0].outputPorts[0].outputStart controlPoint1:workflowJobs[2].inputPorts[0].inputEnd controlPoint2:workflowJobs[2].inputPorts[0].inputEnd endPoint:workflowJobs[2].inputPorts[0].inputEnd];
        [links[5] makeConnectPointAtCurrentPoint:workflowJobs[0].outputPorts[1].outputStart controlPoint1:workflowJobs[4].inputPorts[0].inputEnd controlPoint2:workflowJobs[4].inputPorts[0].inputEnd endPoint:workflowJobs[4].inputPorts[0].inputEnd];
        [links[6] makeConnectPointAtCurrentPoint:workflowJobs[3].outputPorts[0].outputStart controlPoint1:workflowJobs[1].inputPorts[0].inputEnd controlPoint2:workflowJobs[1].inputPorts[0].inputEnd endPoint:workflowJobs[1].inputPorts[0].inputEnd];
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

        // for (i = 0; i < [links count]; i++)
        // {
        //     [self addSubview:links[i]];
        // };


    }

    return self;
}


// - (void)mouseDragged:(CPEvent)anEvent
// {   
    
//     console.log("DRAG - WorkflowDesigner");
//     console.log([CPEvent mouseLocation]);
    
// }

// - (void)mouseDown:(CPEvent)anEvent
// {
//     console.log("DOWN - WorkflowDesigner");
//         console.log([CPEvent mouseLocation]);

// }

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
        // [self setNeedsDisplay:true];
    };

}

- (void)receiveAddLink:(CPNotification)aNotification
{
    console.log("HELLOOOOOO");
}


- (void)receiveRemoveLink:(CPNotification)aNotification
{
    
}


- (void)receiveDragLink:(CPNotification)aNotification
{
    
}


@end
