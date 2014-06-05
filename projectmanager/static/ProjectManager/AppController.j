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

    var j,
        k;
    for (var i = 0; i < [designerView.workflowJobs count]; i++) 
    {
        [contentView addSubview:designerView.workflowJobs[i].workflowJob];

        for (j = 0; j < designerView.workflowJobs[i].outputPortNumber; j++)
        {
            [contentView addSubview:designerView.workflowJobs[i].outputPorts[j].output];
        };

        for (k = 0; k < designerView.workflowJobs[i].inputPortNumber; k++)
        {
            [contentView addSubview:designerView.workflowJobs[i].inputPorts[k].input];
        }

    };



    for (i = 0; i < [designerView.links count]; i++)
    {
        [contentView addSubview:designerView.links[i]];
    };


    [designerView.links[0] makeConnectPointAtCurrentPoint:CGPointMake(310.0, 230.0) 
                                            controlPoint1:CGPointMake(600.0, 100.0) 
                                            controlPoint2:CGPointMake(600.0, 600.0)
                                                 endPoint:CGPointMake(990.0, 430.0)];
            

    [designerView.links[1] makeConnectPointAtCurrentPoint:CGPointMake(310.0, 230.0) 
                                            controlPoint1:CGPointMake(600.0, 10.0) 
                                            controlPoint2:CGPointMake(600.0, 200.0)
                                                 endPoint:CGPointMake(1090.0, 130.0)];

    [designerView.links[2] makeConnectPointAtCurrentPoint:CGPointMake(260.0, 430.0) 
                                            controlPoint1:CGPointMake(500.0, 200.0) 
                                            controlPoint2:CGPointMake(500.0, 350.0)
                                                 endPoint:CGPointMake(1090.0, 130.0)];


    [theWindow orderFront:self];

}



@end

