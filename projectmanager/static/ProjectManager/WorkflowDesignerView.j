@import <Foundation/CPObject.j>

@import "WorkflowJob.j"
@import "Link.j"
@import "OutputPort.j"

//TEMPORARY -> length and width for workflowJob boxes
var LENGTH = 100.0,
    WIDTH = 60.0;

@implementation WorkflowDesignerView : CPView
{
                CPArray             points                      @accessors;
                // CPArray             links                       @accessors;
                CPArray             workflowJobs                @accessors;
}

- (id)initDesigner 
{
    self = [super initWithFrame:CGRectMake(0, 0, 1600, 600)];
    if (self)
    {
        //points array

        points = [[CPArray alloc] init];

        //create points for origins of workflowJob boxes
        points[0] = CGPointMake(200.0, 70.0);
        points[1] = CGPointMake(500.0, 350.0);
        points[2] = CGPointMake(500.0, 70.0);
        points[3] = CGPointMake(200.0, 350.0);


        //links array
        // links = [[CPArray alloc] init];

        // links[0] = [[Link alloc] initWithFrame:CGRectMake(0, 0, 0, 0) name:"AtoB"];
        // links[1] = [[Link alloc] initWithFrame:CGRectMake(0, 0, 0, 0) name:"AtoC"];
        // links[2] = [[Link alloc] initWithFrame:CGRectMake(0, 0, 3000, 3000) name:"DtoC"];


        workflowJobs = [[CPArray alloc] init];

        //create workflowJobs on designerView
        workflowJobs[0] = [[WorkflowJob alloc] initWithPoint:points[0] size:CGSizeMake(WIDTH*2, LENGTH) inputPortNum:3 outputPortNum:2 type:"Lyrical"];
        workflowJobs[1] = [[WorkflowJob alloc] initWithPoint:points[1] size:CGSizeMake(WIDTH, LENGTH) inputPortNum:1 outputPortNum:1 type:"Black & White"];
        workflowJobs[2] = [[WorkflowJob alloc] initWithPoint:points[2] size:CGSizeMake(WIDTH*2, LENGTH) inputPortNum:1 outputPortNum:3 type:"Cropped Border"];
        workflowJobs[3] = [[WorkflowJob alloc] initWithPoint:points[3] size:CGSizeMake(WIDTH, LENGTH) inputPortNum:1 outputPortNum:1 type:"Cropped Border"];

        //change attributes for various workflowJobs
        [workflowJobs[0] changeBoxAttributes:2.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Lryic Removal"];
        [workflowJobs[1] changeBoxAttributes:2.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Black/White Image"];
        [workflowJobs[2] changeBoxAttributes:2.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Border Crop"];
        [workflowJobs[3] changeBoxAttributes:2.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Border Crop"];


        //iterat through workflows inputs and outputs to add to designerView subview
        var j,
            i,
            k,
            f;
        for (i = 0; i < [workflowJobs count]; i++)
        {
            for (j = 0; j < workflowJobs[i].inputPortNumber; j++)
            {
                [workflowJobs[i].inputPorts[j] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"FF4D4D"] boxType:CPBoxPrimary];
            };

            for (k = 0; k < workflowJobs[i].outputPortNumber; k++)
            {
                [workflowJobs[i].outputPorts[k] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];
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

        // for (i = 0; i < [links count]; i++)
        // {
        //     [self addSubview:links[i]];
        // };

    }
    // [self setNeedsDisplay:true];
    return self;
}


- (void)mouseDragged:(CPEvent)anEvent
{   
    
    console.log("DRAG - WorkflowDesigner");
    console.log([CPEvent mouseLocation]);
    
}

- (void)mouseDown:(CPEvent)anEvent
{
    console.log("DOWN - WorkflowDesigner");
        console.log([CPEvent mouseLocation]);

}

@end
