@import <Foundation/CPObject.j>

@import "DesignController.j"
@import "Link.j"


@implementation AppController : CPObject
{
        @outlet     CPWindow                theWindow;
        @outlet     CPView                  contentView;   
                    DesignController        designControlView;


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
    designControlView = [[DesignController alloc] initController];

    [contentView addSubview:designControlView];


    // [designerView.links[0] makeConnectPointAtCurrentPoint:CGPointMake(310.0, 230.0) 
    //                                         controlPoint1:CGPointMake(600.0, 100.0) 
    //                                         controlPoint2:CGPointMake(600.0, 600.0)
    //                                              endPoint:CGPointMake(990.0, 430.0)];
            

    // [designerView.links[1] makeConnectPointAtCurrentPoint:CGPointMake(310.0, 230.0) 
    //                                         controlPoint1:CGPointMake(600.0, 10.0) 
    //                                         controlPoint2:CGPointMake(600.0, 200.0)
    //                                              endPoint:CGPointMake(1090.0, 130.0)];

    // [designerView.links[2] makeConnectPointAtCurrentPoint:CGPointMake(260.0, 430.0) 
    //                                         controlPoint1:CGPointMake(1100.0, 430.0) 
    //                                         controlPoint2:CGPointMake(1100.0, 430.0)
    //                                              endPoint:CGPointMake(1090.0, 130.0)];


    [theWindow orderFront:self];


}


@end

