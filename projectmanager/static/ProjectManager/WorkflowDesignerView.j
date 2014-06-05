@import <Foundation/CPObject.j>

@import "WorkflowJob.j"
@import "Link.j"



@implementation WorkflowDesignerView : CPObject
{
                WorkflowJob         jobA                        @accessors;
                WorkflowJob         jobB                        @accessors;
                WorkflowJob         jobC                        @accessors;
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

        jobA = [[WorkflowJob alloc] initWithPoint:points[0] length:theLength width:theWidth inputPortNum:1 outputPortNum:1 type:"Lyrical"];
        jobB = [[WorkflowJob alloc] initWithPoint:points[1] length:theLength width:theWidth inputPortNum:1 outputPortNum:1 type:"Black & White"];
        jobC = [[WorkflowJob alloc] initWithPoint:points[2] length:theLength width:theWidth inputPortNum:1 outputPortNum:1 type:"Cropped Border"];


        [jobA changeBoxAttributes:2.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Lryic Removal"];
        [jobB changeBoxAttributes:2.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Black/White Image"];
        [jobC changeBoxAttributes:2.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Border Crop"];

        workflowJobs = [[CPArray alloc] init];

        workflowJobs[0] = jobA;
        workflowJobs[1] = jobB;
        workflowJobs[2] = jobC;


        // JOBA

        for (var i = 0; i < jobA.inputPortNumber; i++) 
        {
            [jobA.inputPorts[i] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];
        };

        for (i = 0; i < jobA.outputPortNumber; i++) 
        {
            [jobA.outputPorts[i] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];
        };
        
        // JOBB

        for (i = 0; i < jobB.inputPortNumber; i++) 
        {
            [jobB.inputPorts[i] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];
        };

        for (i = 0; i < jobB.outputPortNumber; i++) 
        {
            [jobB.outputPorts[i] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];
        };

        //JOBC

        for (i = 0; i < jobC.inputPortNumber; i++) 
        {
            [jobC.inputPorts[i] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];
        };

        for (i = 0; i < jobC.outputPortNumber; i++) 
        {
            [jobC.outputPorts[i] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];
        };


        

    }
    return self;
}


@end
