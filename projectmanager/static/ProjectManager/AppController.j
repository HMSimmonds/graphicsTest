@import <Foundation/CPObject.j>

@import "WorkflowDesignerView.j"
@import "ToolPanel.j"


@implementation AppController : CPObject
{
    @outlet             CPWindow                theWindow               @accessors;
    @outlet             CPView                  contentView             @accessors;
                        CGRect                  _theWindowBounds;
                        CPScrollView            contentScrollView;

    @outlet             CPToolbarItem           leftSideBarIcon         @accessors;
    @outlet             CPToolbarItem           rightSideBarIcon        @accessors;
    
    @outlet             CPSplitView             workflowDesignerView    @accessors;
    @outlet             CPView                  designerView            @accessors;
    @outlet             CPSplitView             leftSideBar             @accessors;
    @outlet             CPSplitView             rightSideBar            @accessors;

    @outlet             CPBox                   horizontalDivider1      @accessors;

                        WorkflowDesignerView    workflowDiagram         @accessors;

    @outlet             CPImageView             connectImageView        @accessors;

                        CPBundle                theBundle               @accessors;

    @outlet             CPScrollView            jobScrollView           @accessors;
    @outlet             CPView                  jobsView                @accessors;
    @outlet             CPArray                 jobsViewArray           @accessors;

    @outlet             CPView                  jobA                    @accessors;
    @outlet             CPView                  jobB                    @accessors;
    @outlet             CPView                  jobC                    @accessors;
    @outlet             CPView                  jobD                    @accessors;
    @outlet             CPView                  jobE                    @accessors;
    @outlet             CPView                  jobF                    @accessors;
    @outlet             CPView                  jobG                    @accessors;
    @outlet             CPView                  jobH                    @accessors;
    @outlet             CPView                  jobI                    @accessors;



}
    
- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
    [contentView setNeedsDisplay:true];

    

}

- (void)awakeFromCib
{
    [theWindow setFullPlatformWindow:YES];
    _theWindowBounds = [contentView bounds];
    theBundle = [CPBundle mainBundle];


    var leftSideBarImageIcon = [[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"indent-increase.png"] size:CGSizeMake(15.0, 15.0)],
        rightSideBarImageIcon = [[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"indent-decrease.png"] size:CGSizeMake(15.0, 15.0)];

    [leftSideBarIcon setImage:leftSideBarImageIcon];
    [rightSideBarIcon setImage:rightSideBarImageIcon];


    //init. Bundle to resources

    //init contentView attributes
    [contentView setBackgroundColor:[CPColor colorWithHexString:"FFFFFF"]];
    [contentView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    
    //add scrollView on contentView
    contentScrollView = [[CPScrollView alloc] initWithFrame:[contentView bounds]];
    [contentScrollView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [contentScrollView setHasHorizontalScroller:YES];
    [contentScrollView setHasVerticalScroller:YES];
    [contentScrollView setAutohidesScrollers:YES];
    [contentView setSubviews:[contentScrollView]];

    
    [workflowDesignerView setFrame:_theWindowBounds];
    [workflowDesignerView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [contentView addSubview:workflowDesignerView];


    

    [designerView setFrame:CGRectMake(300.0, 0.0, CGRectGetWidth(_theWindowBounds) - 600.0, CGRectGetHeight(_theWindowBounds))];
    [designerView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [designerView setAutoresizesSubviews:YES];
    [designerView setBackgroundColor:[CPColor colorWithHexString:"FFFFFF"]];
    
    //create instance of WorkflowDesignerView
    workflowDiagram = [[WorkflowDesignerView alloc] initDesigner];
    [workflowDiagram setFrame:[designerView bounds]];
    [designerView addSubview:workflowDiagram];

    //left Side Bar
    [leftSideBar setFrame:CGRectMake(0.0, 0.0, 300.0, CGRectGetHeight(_theWindowBounds))];
    [leftSideBar setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [leftSideBar setBackgroundColor:[CPColor colorWithHexString:"E6E6E6"]];


    //Right Side Bar
    [rightSideBar setFrame:CGRectMake(CGRectGetWidth(_theWindowBounds) - 300.0, 0.0, 300.0, CGRectGetHeight(_theWindowBounds))];
    [rightSideBar setAutoresizingMask:CPViewHeightSizable | CPViewWidthSizable];
    [rightSideBar setBackgroundColor:[CPColor colorWithHexString:"E6E6E6"]];


    // connectImage = [[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"connect.png"]];
    var connectImage = [[CPImage alloc] initWithContentsOfFile:[theBundle pathForResource:@"connect.png"] size:CGSizeMake(32.0, 32.0)];
    [connectImageView setImage:connectImage];

    //job Scroll View

    var scrollBounds = [jobScrollView bounds];

    // [jobsView setFrame:CGRectMake(scrollBounds.origin.x, scrollBounds.origin.y + 10.0, scrollBounds.size.x, [jobsView bounds].size.y)];

    [jobScrollView setBackgroundColor:[CPColor colorWithHexString:"808080"]];
    [jobScrollView setDocumentView:jobsView];

    jobsViewArray = [[CPArray alloc] init]; //used to keep track of jobs. could use controller ? 
    jobsViewArray[0] = jobA;
    jobsViewArray[1] = jobB;
    jobsViewArray[2] = jobC;
    jobsViewArray[3] = jobD;
    jobsViewArray[4] = jobE;
    jobsViewArray[5] = jobF;
    jobsViewArray[6] = jobG;
    jobsViewArray[7] = jobH;
    jobsViewArray[8] = jobI;

    for (var i = 0; i < [jobsViewArray count]; i++)
    {
        [jobsViewArray[i] setBackgroundColor:[CPColor colorWithHexString:"808080"]];
    };




    [theWindow orderFront:self];




}


@end

