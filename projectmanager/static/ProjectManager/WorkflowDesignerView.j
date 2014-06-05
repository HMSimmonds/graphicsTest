@import <Foundation/CPObject.j>

@import "WorkflowJob.j"
@import "Link.j"



@implementation WorkflowDesignerView : CPObject
{

                Link                linkAToB                    @accessors;
                Link                linkAToC                    @accessors;

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


        //links array
        links = [[CPArray alloc] init];

        linkAToB = [[Link alloc] initWithFrame:CGRectMake(0, 0, 3000, 3000)];
        linkAToC = [[Link alloc] initWithFrame:CGRectMake(0, 0, 3000, 3000)];

        var theLength = 100.0,
            theWidth = 60.0;

        workflowJobs = [[CPArray alloc] init];

        workflowJobs[0] = [[WorkflowJob alloc] initWithPoint:points[0] length:theLength width:theWidth inputPortNum:1 outputPortNum:1 type:"Lyrical"];
        workflowJobs[1] = [[WorkflowJob alloc] initWithPoint:points[1] length:theLength width:theWidth inputPortNum:1 outputPortNum:1 type:"Black & White"];
        workflowJobs[2] = [[WorkflowJob alloc] initWithPoint:points[2] length:theLength width:theWidth inputPortNum:1 outputPortNum:1 type:"Cropped Border"];


        [workflowJobs[0] changeBoxAttributes:2.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Lryic Removal"];
        [workflowJobs[1] changeBoxAttributes:2.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Black/White Image"];
        [workflowJobs[2] changeBoxAttributes:2.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Border Crop"];




        // JOBA

        for (var i = 0; i < workflowJobs[0].inputPortNumber; i++) 
        {
            [workflowJobs[0].inputPorts[i] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];
        };

        for (i = 0; i < workflowJobs[0].outputPortNumber; i++) 
        {
            [workflowJobs[0].outputPorts[i] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];
        };
        
        // workflowJobs[1]

        for (i = 0; i < workflowJobs[1].inputPortNumber; i++) 
        {
            [workflowJobs[1].inputPorts[i] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];
        };

        for (i = 0; i < workflowJobs[1].outputPortNumber; i++) 
        {
            [workflowJobs[1].outputPorts[i] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];
        };

        //workflowJobs[2]

        for (i = 0; i < workflowJobs[2].inputPortNumber; i++) 
        {
            [workflowJobs[2].inputPorts[i] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];
        };

        for (i = 0; i < workflowJobs[2].outputPortNumber; i++) 
        {
            [workflowJobs[2].outputPorts[i] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];
        };


        

    }
    return self;
}


@end
