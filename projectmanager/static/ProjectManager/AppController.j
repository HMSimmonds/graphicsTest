@import <Foundation/CPObject.j>

@import "WorkflowDesignerView.j"



@implementation AppController : CPObject
{
        @outlet     CPWindow                theWindow;
        @outlet     CPView                  contentView;   

                    WorkflowDesignerView    designerView    @accessors;

}
    
- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.


}

- (void)awakeFromCib
{
    [theWindow setFullPlatformWindow:YES];
    contentView = [theWindow contentView];
    [contentView setBackgroundColor:[CPColor colorWithHexString:"FFFFFF"]];
    

    //create instance of WorkflowDesignerView
    designerView = [[WorkflowDesignerView alloc] init];


    [contentView addSubview:designerView.workflowJobs[0].workflowJob];
    [contentView addSubview:designerView.workflowJobs[1].workflowJob];
    [contentView addSubview:designerView.workflowJobs[2].workflowJob];


// jobA

    for (var i = 0; i < designerView.workflowJobs[0].inputPortNumber; i++)
    {
        [contentView addSubview:designerView.workflowJobs[0].inputPorts[i].input];
    };

    for (i = 0; i < designerView.workflowJobs[0].outputPortNumber; i++)
    {
        [contentView addSubview:designerView.workflowJobs[0].outputPorts[i].output];
    };

// job B

    for (i = 0; i < designerView.workflowJobs[1].outputPortNumber; i++)
    {
        [contentView addSubview:designerView.workflowJobs[1].outputPorts[i].output];
    };

    for (i = 0; i < designerView.workflowJobs[1].inputPortNumber; i++)
    {
        [contentView addSubview:designerView.workflowJobs[1].inputPorts[i].input];
    };

   // job C

    for (i = 0; i < designerView.workflowJobs[2].outputPortNumber; i++)
    {
        [contentView addSubview:designerView.workflowJobs[2].outputPorts[i].output];
    };

    for (i = 0; i < designerView.workflowJobs[2].inputPortNumber; i++)
    {
        [contentView addSubview:designerView.workflowJobs[2].inputPorts[i].input];
    };



    [contentView addSubview:designerView.linkAToB];
    [contentView addSubview:designerView.linkAToC];


    [designerView.linkAToB makeConnectPoint:310.0 currentPointY:230.0 
            controlPoint1X:600.0 controlPoint1Y:100.0 
            controlPoint2X:600.0 controlPoint2Y:600.0 
            endPointX:990.0 endPointY:430.0];

    [designerView.linkAToC makeConnectPoint:310.0 currentPointY:230.0 
            controlPoint1X:600.0 controlPoint1Y:10.0 
            controlPoint2X:600.0 controlPoint2Y:200.0 
            endPointX:1090.0 endPointY:130.0];


    [theWindow orderFront:self];

}



@end

