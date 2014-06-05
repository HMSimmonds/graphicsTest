@import <Foundation/CPObject.j>

@import "WorkflowJob.j"
@import "Link.j"

var LENGTH = 100.0,
    WIDTH = 60.0;

@implementation WorkflowDesignerView : CPObject
{
                CPArray             points                      @accessors;
                CPArray             links                       @accessors;
                CPArray             workflowJobs                @accessors;
}

- (id)init 
{
    self = [super init];
    if (self)
    {

        //points array

        points = [[CPArray alloc] init];

        points[0] = CGPointMake(200.0, 200.0);
        points[1] = CGPointMake(1000.0, 400.0);
        points[2] = CGPointMake(1100.0, 100.0);
        points[3] = CGPointMake(150.0, 400.0);


        //links array
        links = [[CPArray alloc] init];

        links[0] = [[Link alloc] initWithFrame:CGRectMake(0, 0, 3000, 3000) name:"AtoB"];
        links[1] = [[Link alloc] initWithFrame:CGRectMake(0, 0, 3000, 3000) name:"AtoC"];
        links[2] = [[Link alloc] initWithFrame:CGRectMake(0, 0, 3000, 3000) name:"DtoC"];


        workflowJobs = [[CPArray alloc] init];

        workflowJobs[0] = [[WorkflowJob alloc] initWithPoint:points[0] size:CGSizeMake(WIDTH, LENGTH) inputPortNum:1 outputPortNum:1 type:"Lyrical"];
        workflowJobs[1] = [[WorkflowJob alloc] initWithPoint:points[1] size:CGSizeMake(WIDTH, LENGTH) inputPortNum:1 outputPortNum:1 type:"Black & White"];
        workflowJobs[2] = [[WorkflowJob alloc] initWithPoint:points[2] size:CGSizeMake(WIDTH, LENGTH) inputPortNum:1 outputPortNum:1 type:"Cropped Border"];
        workflowJobs[3] = [[WorkflowJob alloc] initWithPoint:points[3] size:CGSizeMake(WIDTH, LENGTH) inputPortNum:1 outputPortNum:1 type:"Cropped Border"];


        [workflowJobs[0] changeBoxAttributes:2.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Lryic Removal"];
        [workflowJobs[1] changeBoxAttributes:2.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Black/White Image"];
        [workflowJobs[2] changeBoxAttributes:2.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Border Crop"];
        [workflowJobs[3] changeBoxAttributes:2.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Border Crop"];



        var j,
            k;
        for (var i = 0; i < [workflowJobs count]; i++)
        {
            for (j = 0; j < workflowJobs[i].inputPortNumber; j++)
            {
                [workflowJobs[i].inputPorts[j] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];
            };

            for (k = 0; k < workflowJobs[i].outputPortNumber; k++)
            {
                [workflowJobs[i].outputPorts[k] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];
            };
        };

    }
    return self;
}


@end
