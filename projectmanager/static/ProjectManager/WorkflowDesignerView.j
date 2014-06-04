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
                CGPoint             pointA                      @accessors;
                CGPoint             pointB                      @accessors;
                CGPoint             pointC                      @accessors;

                CPArrayController   linksController             @accessors;
                CPArrayController   pointsController            @accessors;
                CPArrayController   workflowJobController       @accessors;

}

- (id)init 
{
    self = [super init];
    if (self)
    {


        // linksController = [[CPArrayController alloc] init];
        // pointsController = [[CPArrayController alloc] init];
        // workflowJobController = [[CPArrayController alloc] init];

        pointA = CGPointMake(200.0, 200.0);
        pointB = CGPointMake(1000.0, 400.0);
        pointC = CGPointMake(1100.0, 100.0);



        var theLength = 100.0,
            theWidth = 60.0;

        jobA = [[WorkflowJob alloc] initWithPoint:pointA length:theLength width:theWidth inputPortNum:1 outputPortNum:1 type:"Lyrical"];
        jobB = [[WorkflowJob alloc] initWithPoint:pointB length:theLength width:theWidth inputPortNum:1 outputPortNum:1 type:"Black & White"];
        jobC = [[WorkflowJob alloc] initWithPoint:pointC length:theLength width:theWidth inputPortNum:1 outputPortNum:1 type:"Cropped Border"];


        [jobA changeBoxAttributes:2.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Lryic Removal"];
        [jobB changeBoxAttributes:2.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Black/White Image"];
        [jobC changeBoxAttributes:2.0 cornerRadius:15.0 fillColor:[CPColor colorWithHexString:"E6E6E6"] boxType:CPBoxPrimary title:"Border Crop"];

        // JOBA

        for (var i = 0; i < jobA.inputPortNumber; i++) 
                [[[jobA.inputPortsController selectedObjects] objectAtIndex:i] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];


        for (i = 0; i < jobA.outputPortNumber; i++) 
            [[[jobA.outputPortsController selectedObjects] objectAtIndex:i] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];
        
        // JOBB

        for (i = 0; i < jobB.inputPortNumber; i++) 
            [[[jobB.inputPortsController selectedObjects] objectAtIndex:i] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];

        for (i = 0; i < jobB.outputPortNumber; i++) 
            [[[jobB.outputPortsController selectedObjects] objectAtIndex:i] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];

        //JOBC

        for (i = 0; i < jobC.inputPortNumber; i++) 
            [[[jobC.inputPortsController selectedObjects] objectAtIndex:i] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];

        for (i = 0; i < jobC.outputPortNumber; i++) 
            [[[jobC.outputPortsController selectedObjects] objectAtIndex:i] changeBoxAttributes:2.0 cornerRadius:2.0 fillColor:[CPColor colorWithHexString:"003366"] boxType:CPBoxPrimary];


        linkAToB = [[Link alloc] initWithFrame:CGRectMake(0, 0, 3000, 3000)];
        linkAToC = [[Link alloc] initWithFrame:CGRectMake(0, 0, 3000, 3000)];

    }
    return self;
}


@end
